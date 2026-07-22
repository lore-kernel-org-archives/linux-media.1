Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E560313E0D
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 06:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784702274; cv=none; b=rl1dhs9zhx5Y2iK17MAxTxm6xIiy4ywo7rJKB8AIHHfIQp5cv/nolsSOnDZAZKgs4O0bMSKCTeYvfsZzFlxEDvjiyVOSwEw91L0/D3sDR2buZq5jaCAVwJrot+uaoXmFuupkPPWREx8zotq9GPEZydljr1d2VOoyaB91hh4BXCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784702274; c=relaxed/simple;
	bh=22Ri7F6Fz4ZUtOVTmseNQDsSWHbZZkGgFUeVq3LZqBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dvxLDdsXMN2iYzfdZ2WFffwYIzwgl+IGvvl95cwGrUr61e9YmSJUCbx+j3wN88Spnp64G7muVIWw4WI/xGasFdFcSnG9f19d9yTQcUHGt4fDITshvWAKhsB+zFVb/0L2AYoTVTyXL/a93b9Cx85PdynuLqBL4mBHg8bm7fd7CAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oVtkMEni; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oVtkMEni"
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BD25014C6;
	Wed, 22 Jul 2026 08:36:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784702212;
	bh=22Ri7F6Fz4ZUtOVTmseNQDsSWHbZZkGgFUeVq3LZqBg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oVtkMEnikm/7YZ7QdMETxhJsYYS+DFGBJfPtTFdfaV6SkLntEaffJj+kUV3uosCX3
	 Tt4GNxoQlNItvm0IQqaqSF8u3ChsU7yg2W2z27UbSViddWGXfdKmaclpQ6c02AH+jO
	 HNugon52H+DHwNGOrvq9bwYmJYTy1QzGZNqeOgAg=
Message-ID: <e9a8c1f1-b3b0-42d0-a7a6-064ef9d17269@ideasonboard.com>
Date: Wed, 22 Jul 2026 07:37:48 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: Expand gain values for ov5693
To: Jai Luthra <jai.luthra@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
References: <20260721-ov5693-gain-v1-1-0eaaee0a7bd4@ideasonboard.com>
 <178469889965.3005206.14178748283924753900@freya>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <178469889965.3005206.14178748283924753900@freya>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Morning Jai

On 22/07/2026 06:41, Jai Luthra wrote:
> Hi Dan,
> 
> Thank you for the patch.
> 
> Quoting Daniel Scally (2026-07-22 03:49:19)
>> The ov5693 driver currently allows values for the
>> V4L2_CID_ANALOGUE_GAIN control in the range 1-127. The input values
>> are left-shifted 4 bits before being applied to the hardware. The 4
>> least significant bits are fractional bits, which means that in
>> practice gain can only be applied in steps of 1.0.
>>
>> Update the allowed range to take any value that fits into the 11-bit
>> register and stop masking off the fractional bits.
>>
>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>> ---
>>   drivers/media/i2c/ov5693.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
>> index 4cc796bbee9263c032384d8327961b5cee52b9e7..1fedd835fb69532ebc3b48b7b8c9b02744bf3da4 100644
>> --- a/drivers/media/i2c/ov5693.c
>> +++ b/drivers/media/i2c/ov5693.c
>> @@ -48,10 +48,10 @@
>>   
>>   /* Analogue Gain */
>>   #define OV5693_GAIN_CTRL_REG                   CCI_REG16(0x350a)
>> -#define OV5693_GAIN_CTRL_MASK                  GENMASK(10, 4)
>> +#define OV5693_GAIN_CTRL_MASK                  GENMASK(10, 0)
>>   #define OV5693_GAIN_MIN                                1
>> -#define OV5693_GAIN_MAX                                127
>> -#define OV5693_GAIN_DEF                                8
>> +#define OV5693_GAIN_MAX                                2047
>> +#define OV5693_GAIN_DEF                                16
> 
> Earlier the register write for the default value would be 8 << 4, so 128.
> But now it's 16. I am not sure if that was intended, if it was maybe add a
> note in the commit message.

It was intended yes, the old default wasn't applying a gain of 1.0. Sorry that wasn't clear. I'll 
expand the commit message

Thanks
Dan

> 
> Thanks,
>      Jai
> 
>>   #define OV5693_GAIN_STEP                       1
>>   
>>   /* Digital Gain */
>> @@ -444,7 +444,7 @@ static int ov5693_analog_gain_configure(struct ov5693_device *ov5693, u32 gain)
>>   {
>>          int ret = 0;
>>   
>> -       gain = (gain << 4) & OV5693_GAIN_CTRL_MASK;
>> +       gain &= OV5693_GAIN_CTRL_MASK;
>>   
>>          cci_write(ov5693->regmap, OV5693_GAIN_CTRL_REG, gain, &ret);
>>   
>>
>> ---
>> base-commit: a52e6f7923c17a672135b485ffd96fbd72f46267
>> change-id: 20260721-ov5693-gain-e4362204ee4e
>>
>> Best regards,
>> -- 
>> Daniel Scally <dan.scally@ideasonboard.com>
>>
>>

