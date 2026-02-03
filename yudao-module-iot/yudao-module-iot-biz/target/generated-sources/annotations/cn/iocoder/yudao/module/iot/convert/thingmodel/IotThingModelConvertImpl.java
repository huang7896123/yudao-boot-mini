package cn.iocoder.yudao.module.iot.convert.thingmodel;

import cn.iocoder.yudao.module.iot.controller.admin.thingmodel.vo.IotThingModelSaveReqVO;
import cn.iocoder.yudao.module.iot.dal.dataobject.thingmodel.IotThingModelDO;
import javax.annotation.processing.Generated;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2026-01-14T19:48:54+0800",
    comments = "version: 1.6.3, compiler: javac, environment: Java 18.0.2.1 (Oracle Corporation)"
)
public class IotThingModelConvertImpl implements IotThingModelConvert {

    @Override
    public IotThingModelDO convert(IotThingModelSaveReqVO bean) {
        if ( bean == null ) {
            return null;
        }

        IotThingModelDO.IotThingModelDOBuilder iotThingModelDO = IotThingModelDO.builder();

        iotThingModelDO.id( bean.getId() );
        iotThingModelDO.identifier( bean.getIdentifier() );
        iotThingModelDO.name( bean.getName() );
        iotThingModelDO.description( bean.getDescription() );
        iotThingModelDO.productId( bean.getProductId() );
        iotThingModelDO.productKey( bean.getProductKey() );
        iotThingModelDO.type( bean.getType() );

        iotThingModelDO.property( convertToProperty(bean) );
        iotThingModelDO.event( convertToEvent(bean) );
        iotThingModelDO.service( convertToService(bean) );

        return iotThingModelDO.build();
    }
}
