import { Injectable } from '@nestjs/common';
import { TypeOrmCrudService } from '@nestjsx/crud-typeorm';
import { Feature } from '../../../entities/Feature';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import DistinctFeaturesValuesDto from '../../dtos/feature/distinct.feature.values.dto';
import { ArticleFeature } from '../../../entities/ArticleFeature';

@Injectable()
export class FeatureService extends TypeOrmCrudService<Feature> {
  constructor(
    @InjectRepository(Feature)
    private readonly feature: Repository<Feature>,
    @InjectRepository(ArticleFeature)
    private readonly articleFeature: Repository<ArticleFeature>, //!!!! app module
  ) {
    super(feature);
  }

  async getDistinctValuesByCategoryId(
    categoryId: number,
  ): Promise<DistinctFeaturesValuesDto> {
    const features = await this.feature.findBy({
      categoryId: categoryId,
    });

    const featureResults: DistinctFeaturesValuesDto = {
      features: [],
    };

    if (!features || features.length === 0) {
      return featureResults;
    }

    //for each ili map

    featureResults.features = await Promise.all(
      features.map(async (feature) => {
        const values: string[] = (
          await this.articleFeature
            .createQueryBuilder('af')
            .select('DISTINCT af.value', 'value')
            .where('af.featureId= :featureId', { featureId: feature.featureId })
            .orderBy('af.value', 'ASC')
            .getRawMany()
        ).map((item) => item.value);

        return {
          featureId: feature.featureId,
          name: feature.name,
          values: values,
        };
      }),
    );
    return featureResults;
  }
}
