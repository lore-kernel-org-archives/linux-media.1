Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC2A3FF1A5
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 13:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790860691; cv=none; b=bZ4uPfg9hnram6T9c4s7HQ+qZdhFzczOIN1IHfiRMNAphWgk/DW3Vy2rULbxurRSMaK6kw6Ae4FCgU70bdxBr/0CBHo6qML2c7pK/uopzkmiiPupRhcewS2Jvg7lbOiskAlS4jxYAjBpIWTnt+qDo7s4L6lBGXj1aj5QvDmYIUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790860691; c=relaxed/simple;
	bh=9WLH9+Lg9mafi3RlCnOSyDHhnDNxTttruE8nd/FvIYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IVvdHY7usqAQChf/Xs82KNIDfuvjj1rSkFQAhadLBozoJqkpR6I7pnRF+jVNm3zVaxbjWayrqOuOMAmcsSKN620HGFA8050t0cVNg4bEsCX3uGn0TLeKbhVlDNUKi4kbbPEpUsRT+cBLeOUpKX3ueApLgdqhK7frPdVaZxE3kqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cyYh0uph; arc=none smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="cyYh0uph"
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6acb8b78d6cso4497570a12.2
        for <linux-media@vger.kernel.org>; Thu, 01 Oct 2026 06:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1790860687; x=1791465487; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w6Ys2U4rK4qRXJ88N00bl2NDAdA3PBqSlYtGtuTGakU=;
        b=cyYh0uph5j4XXWDyUjyJkswE2v0C51tGVz3fQo/SMyUI6O4J21ZPLAJXiASj1TEMbT
         HqLiQcDzskydo6kgP6/yd4w9Mz8cE1bX5Fta+VIyFLh26n6MAit3BLWX1iwfn8nkFoT5
         +k1OMAQwJba1EwYJ6UUtraFG49xlBsbCn9Sx7xGWtPD5ZvejjeJPkwjOJC8TOF1GMNc3
         GrRYyj679njLdTJTt7dlcevGW9CnLQ7PtgAQnDLQJ+c9dVq4/NieVAFoKBPZWLcQ4/eY
         kaa8QQIgEd4au6dBfIxqZd9hEAyFYOjRpUGiVFQsFJUDo48x1ccMBFiYrPfAUCutFjhI
         V7vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790860687; x=1791465487;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w6Ys2U4rK4qRXJ88N00bl2NDAdA3PBqSlYtGtuTGakU=;
        b=YEnOysVuWE3wu67UXj8luI4r8RpJBJz92nW/MDhmhC6vYme1TDIZ/r0LE1J4PUdCHD
         ki+eCrfQU0jRntkp8FiLVz1JNot9m6vBus4cRh0kGBSPeoh3t+SEQJaZEbT8rdV6bRUo
         aV35Bjz9sqsYIjGKxbuHqXyEdShTmqoL9G1q5RW6Um4iqXTro+ZlouxZZ1UDMkxNtd2M
         DnXDdQ3FtjPYCYmkffCqkzwggoWaEJMTFG/c+R0hb7DiDcrM9ETvqmAbpoI954vADcqu
         iKn0pNujBJlwx6Yr7nqR5AEKCMT7KksEpuAQXvG8a32Lj21oYe6AkLPz8zfbpk82s7VV
         vHrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOD9LLHYYSc8mLsIxlXmlvclGFN7RxJHjt4+BmV78nRKFmJPrORMfi/GLGjfR4H9ETSEyj63ygywpKEg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLEoQrstJDdlnzZkQ9g+8u/OJGP2DCo3uGAQoOc38VMatyqLh6U
	bDvz/SZ96nP3psPLTtAPTWvcYdcYfRuovlMoDvnaPhVvmE4du3+i6Alt1m1JP0OY09Y=
X-Gm-Gg: AYBFou2na2/O3b/wwiTKR9ghmusDK4CJoI5kqlc94vSJLFPVdBsmAf4WEAClkm4suGQ
	7Fl0gpXGDxc/wBO2V998iQ7b7b/T4UhhDrm97OsjTZQjKflSTx2POwBser24yPzyT1Co+O+Tvbh
	EsP1CCGaNnQM9qVecwl1b5Hev7ryPD6IAtXEhvxRKDeXi/vV2t6PrkVYf2umUley2fFz5Dx6Y5o
	8Oza5ORz8UcU7Za0dg/EA14Tsp0rWFqb+e8g/8GQDbRZlD/xP1R2vP5QpYo3pnoBycaMXUEL7bz
	AWu/I8+Xb4xBEG6A/chVRBdbl3Fq2TM3FmWN6b31HhM0mE1FyeDThoTCjfquun+U6DN3VVjDe4C
	yI4h1qkBgk/MyjwJ/uwdH4GxL55y8pnEoxkZhAhKosMIXkjx7PW6RcFOKmzumm38GgYUVhyvECn
	5RUHV40jE5F7qqVcys7GNFY3Sd6nmIt5zo5Y08H5UnFtQreoB8at9vH6lJqzhEGeVylULATyG0I
	tzfivpI05b7EBoRCG/OmVyAUTWlAAQeVpNktaHwsr4nVM0vKJogotCSBQ==
X-Received: by 2002:a05:6402:2794:b0:6ac:ae52:8b75 with SMTP id 4fb4d7f45d1cf-6ae19978a4fmr3453730a12.44.1790860676581;
        Thu, 01 Oct 2026 06:17:56 -0700 (PDT)
Received: from [172.16.220.225] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae5ca63130sm1146160a12.20.2026.10.01.06.17.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 06:17:56 -0700 (PDT)
Message-ID: <16efc0e1-8986-418c-87ba-9bf1ca4e4088@fairphone.com>
Date: Thu, 1 Oct 2026 15:17:55 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: media: i2c: dw9800: Redocument
 DW9800K
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, Luca Weiss <luca.weiss@fairphone.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20260914-b4-dw9800k_cleanup-v2-0-6553273aaa33@fairphone.com>
 <20260914-b4-dw9800k_cleanup-v2-1-6553273aaa33@fairphone.com>
 <20260916-meek-qualified-penguin-fd8cea@quoll>
Content-Language: en-US
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
In-Reply-To: <20260916-meek-qualified-penguin-fd8cea@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/16/26 11:06, Krzysztof Kozlowski wrote:
> On Mon, Sep 14, 2026 at 12:25:56PM +0200, Griffin Kroah-Hartman wrote:
>> The DW9800K's properties are too different to justify sharing the same
>> bindings file as the dw9719, Create a separate bindings documentation
>> for the Dongwoon Anatech DW9800K with it's updated properties.
>>
>> More specifically:
>>
>> The DW9800K did not share the SAC1 and SAC6 modes
>> that the DW9719 used.
>>
>> The DW9800K does not actually have a register that matches the property
>> description of vcm-prescale, instead the description of the clock-presc
>> in the DW9768 is much more applicable to the functionality required
>> according to the DW9800K datasheet.
> 
> I don't get why it does not match. You have exactly the same first part
> of the description, look:
> 
There is no inherent difference between the two property names, the 
values that the previous binding was using was completely incorrect with 
the hardware.

The reason for this discrepancy in the first place was us guessing which 
properties that this driver would need based on the datasheets we had 
for older dongwoon devices.

> dw9719:
>    Indication of VCM switching frequency dividing rate select
> 
> Your code:
>    Indication of VCM internal clock dividing rate select,
> 
> Both are dividing the VCM clock rate, no?
> 
clock-presc is used in a different dongwoon binding (dw9768) which more 
accurately matches the function of the hardware, So we concluded that it 
was a more appropriate name.
either way, the values we were using with this property was completely 
incorrect, so it had to be changed either way.

If you'd really prefer us use the older property name we can change it.

> Best regards,
> Krzysztof
> 
many thanks,
Griffin
