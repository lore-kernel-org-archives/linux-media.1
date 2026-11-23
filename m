Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=84.42.129.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795456040;
	b=XWbdqVEjLgAkZ5kQQLk+vr5ED35iiKyYZv8sEeUK1YZHUlaRV2mpA3ji8U6VOWAt+bKV
	 94tePwS9XB5DbQnKleQ5z82czxrQOoS1Fd/7RTXu8IoAhvezG0oVPEGCu6O+wgWIY7doR
	 /Nj4SLbfR74j4PieUGATdSgQRDErrHi1fmHWNtwGc+uv9afPG2jdvAo6lK6sZLIFBNN1m
	 IDP41Quky4JKFrsOUxhk2R+kaUW2krnPDC8HdRZsn9mkcsFiZQHR39jqD9lhtsQxzhb2W
	 2Ix7U1zbAhHayb1i3FpK4ridHhKyuB9eWg63w2Di59EU1pzjuYAistecDhGJ0pyvK1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795456040;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=KJ+qZXgGJu+2QOQssohcMg51b5jRGstSAHnCRdWh0Nc=;
	b=WkvElTyq23El7m/6W/ATOp2Azv2LdIKAKD6v+HbIafW4DOaezktfigmCpZjOf11f2Ceu
	 MUCrsgRfo/xMkkihpkSJ0IP8Rf2NO3E1kLhtA5VNqk5RR3Z+zB1q6ihZkjnjl4D7dbySk
	 qfFQcGINMqQ6JNmQMNYlfbFwYfYD1/lGelHSpX+jRbi29LJT6fVQgRHyqJiRFXEQeyF7h
	 LUXu+Qko8rJ0Y2d2Ruf1nraQf+F3t7AfSiJ+uMDLhBZbn7WQHMhnKRigd9E8FQMUyqVQb
	 gElEnC3nNScT+LBh4WYLGelgOcO98Yfl91ZiPRRBU4Dc45lX1Ens9JtpPYq8Kw4n2Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ixit.cz;
	spf=pass smtp.mailfrom=ixit.cz;
	dkim=pass header.d=ixit.cz header.i=@ixit.cz header.a=rsa-sha256 header.s=dkim header.b=vbc+Ig9e;
	arc=none smtp.remote-ip=84.42.129.46
Received: from ixit.cz (ixit.cz [84.42.129.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733C5606A31A
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 17:47:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 733C5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ixit.cz header.i=@ixit.cz header.a=rsa-sha256 header.s=dkim header.b=vbc+Ig9e
Received: from [IPV6:2a02:830a:f787:8f00:d622:eaa3:3dd6:8f5e] (unknown [IPv6:2a02:830a:f787:8f00:d622:eaa3:3dd6:8f5e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 0CEF95340237;
	Mon, 23 Nov 2026 18:47:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1795456037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KJ+qZXgGJu+2QOQssohcMg51b5jRGstSAHnCRdWh0Nc=;
	b=vbc+Ig9eL54fESGChS5SIipBuBbwoMCNs1MtqGpczawUDs9j7UQuMprIKKzDrhVIKz5303
	PfOz+h+r/q+w/HltR91OjYx2ijdnapS4izEEtgQ9XNBWrcnAsbKl8knASWwKMi1K/d7Ifi
	Cfvsw+BhmWKWhduSMKHm1iuND10seyw=
Message-ID: <7f0c3af1-0251-45d5-9413-6549950d273b@ixit.cz>
Date: Mon, 23 Nov 2026 18:47:16 +0100
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] media: ccs: Use dev_dbg() instead of dev_err() in
 ccs_enum_mbus_code()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org
References: <20261123-ccs-clanked-fixes-v1-0-fb2bcc87a517@ixit.cz>
 <20261123-ccs-clanked-fixes-v1-1-fb2bcc87a517@ixit.cz>
 <20261123165304.GC2959742@killaraus.ideasonboard.com>
Content-Language: en-US, cs-CZ
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <20261123165304.GC2959742@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/11/2026 17:53, Laurent Pinchart wrote:
> On Mon, Nov 23, 2026 at 01:02:39PM +0100, David Heidelberg via B4 Relay wrote:
>> From: David Heidelberg <david@ixit.cz>
>>
>> Commit 63bd19442f08 accidentally converted two dev_dbg() calls in
>> ccs_enum_mbus_code() to dev_err(), flooding the kernel log with error
>> messages whenever userspace enumerates media bus codes.
>>
>> Restore them to dev_dbg().
>>
>> Fixes: 63bd19442f08 ("media: ccs: Use %u for printing unsigned values, remove extra debug print")
> 
> According to the git history those have been there since the first
> version of the driver (named smiapp back then).
> 
> The change is good, the commit message needs an update.

Thank you, will be fixed in the v2!

David

> 
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>>   drivers/media/i2c/ccs/ccs-core.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
>> index c3592317ee575..284cfbd89349c 100644
>> --- a/drivers/media/i2c/ccs/ccs-core.c
>> +++ b/drivers/media/i2c/ccs/ccs-core.c
>> @@ -2104,17 +2104,17 @@ static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
>>   			      struct v4l2_subdev_state *sd_state,
>>   			      struct v4l2_subdev_mbus_code_enum *code)
>>   {
>>   	struct i2c_client *client = v4l2_get_subdevdata(subdev);
>>   	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
>>   	unsigned int i;
>>   	int idx = -1;
>>   
>> -	dev_err(&client->dev, "subdev %s, pad %u, index %u\n",
>> +	dev_dbg(&client->dev, "subdev %s, pad %u, index %u\n",
>>   		subdev->name, code->pad, code->index);
>>   
>>   	if (subdev != &sensor->src->sd || code->pad != CCS_PAD_SRC) {
>>   		if (code->index)
>>   			return -EINVAL;
>>   
>>   		code->code = sensor->internal_csi_format->code;
>>   
>> @@ -2122,17 +2122,17 @@ static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
>>   	}
>>   
>>   	for (i = 0; i < ARRAY_SIZE(ccs_csi_data_formats); i++) {
>>   		if (sensor->mbus_frame_fmts & BIT_U64(i))
>>   			idx++;
>>   
>>   		if (idx == code->index) {
>>   			code->code = ccs_csi_data_formats[i].code;
>> -			dev_err(&client->dev, "found index %u, i %u, code %x\n",
>> +			dev_dbg(&client->dev, "found index %u, i %u, code %x\n",
>>   				code->index, i, code->code);
>>   			return 0;
>>   		}
>>   	}
>>   
>>   	return -EINVAL;
>>   }
>>   
> 

