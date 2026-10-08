Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17F049B474
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 13:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791464925; cv=none; b=YFNwoOtVGwowKRTgBA1xK9SWJkuMc/3xTamHbibvC/HiNPgxaEuQL69TfDQTSyX/b1JEQmSqIsAdO5VWAeQ4hEBzGPyuEXjZLsiw4IIuHHcNOOpN+x52dyLtv+uQg3WZoRM/mGtQrIBso5Ix8o6aLY38fC/5XB+Lb2wF4IonoQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791464925; c=relaxed/simple;
	bh=QwH8JTwtGqJvwi5xVGeamby7ttvbkMogom5klSRXEsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yq8sfnbhpA9cnOdvUCR8pdaxdo41ZLL/khztel8z/METnpBNK9qijyG/vhvRJnbJ4FTcVMk2O0eLxMoalAeMafQaxCp1UE7LprTRFZTsFEub/kxVY4p24urNtVDd8/GpHx3vmL5b4k+TfQGbcUzMdL6yiOb1391bHLQnyhDWCNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X0oLT9Ey; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X0oLT9Ey"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6ae27f06c2fso8369599a12.3
        for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 06:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791464922; x=1792069722; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1zkMv5B4UbM6QWd5wAgGktVY1O+Cdav6y2Be1vNvxcA=;
        b=X0oLT9EyliWOrrQHunWButGnWLrnv8iI5Grzo7TvdHwvh+N1ucYZDp3dV/1xQmJaDq
         fx8NeECMI8fU5WFAkPhGsPxDBmep5r9l0sCadEvcRO1/Sa3hB8ygYEJ3ZS0a+C4sm6cb
         SOzvQFvzTQRDt3C0lNWueurrpKQO1VH4k3Vpeq7T+i8dy23abpD0ebMaWmRyFNvlVqqn
         51oWQTuYBBI3X2BKJBRmfnwJn2uawpiKro1JKr9XWs+fLi3EnYDmpLFa6HcMM9+Uv6Hx
         AVp+auFML++HELT3SNbdTgc6Jk7UPkWy+HAwt4A2+6GBepIww+K5lW1/g+bcfDO4Nwc2
         sciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791464922; x=1792069722;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1zkMv5B4UbM6QWd5wAgGktVY1O+Cdav6y2Be1vNvxcA=;
        b=DfrpvN3WSWxqZTms5KBBmf9L3XudSZnTUlmOePYvRYChyhwkT/vRX+tNHQCxAk7rQM
         5HKby7c1ItTiSU3ysgSmEzMWgk0sJWI+NiFXg9D+ON2dlqrYaS3b72YZkFQSva3jGuhY
         5J+XqsrSG70t1+Q4waMU6fykUwyf58DOV54SAXjvsEAD+Y6pjh676erD+3zQhJ/mmm/x
         j1C9fZnkAYpnAWb0QuiUvBrZzldncQu7MhfxIEoR/PyiolJGw0wRwBZ8RFsRRAjy7f6e
         YZOPLFH/4ktv6OUI4Sc3HYuP4CsDT9t65aD/vfbINh3br0SE5pDCpoSIatnnAnF3bJUP
         VLXw==
X-Gm-Message-State: AFuF++mwZEDa5QnhyJpVK7apQ6gBIlu+enOwjKM01DbSFHcduu8NXz9T
	Nn/Fw5jRkyvxgonyuemFAyjtm+DTlpHUsX52IKFRgymcNHKncBQVCm2ZoGaoKO8AG2g=
X-Gm-Gg: AYBFou0K4loEFPtvS9a2iN0u73womImTfP7D1eVR6B5mbdZUoqPGM8cE52s4puyGqow
	9gNl1s9gy8oOg+vvKqpjo3OCkVkOaCYxLo0PQAYuCNBdAwo/fngOjByDSj9jQF6r7RjJGBUQRoh
	0d0R907KluVR3mdIgFQfyGaCL+VorBGEzcLH+fsDAmkze1BlvUQpWqQeNzA6bOFvEcK0xB9sjvM
	4FfKpVRwWAKgRUTXK+rUZcH+szVU7D+Eqy8YlbA5iVKqXnprs6/IWYnBCAsaRt2b/rTXjUica4z
	UdwUZsYVvwR/B3IWcXTZ+2k9d/BgH2PhZWRh1tBwn3raogILGnQWKZOwDGeeCZKvUnAT10nHrEC
	54mk2lKR4xharakqjXoSWQd5mmAMNKexuNk9htZueu0BvWNUlsaWTozwtvx98+GulMg3LcVzmD7
	NJMTlPNozx4RI6e62SrpyAHaTvDVzjuJHaZDfoKsXwLVFVs6IW8OdVCNpOtastKuqWEcEDEJZUe
	eOnqWmj/9SY
X-Received: by 2002:a17:907:3d12:b0:c2e:3ed7:7db4 with SMTP id a640c23a62f3a-c317c08dd5fmr521063766b.23.1791464921762;
        Thu, 08 Oct 2026 06:08:41 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.203.235])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c317c2fd4a2sm224034166b.56.2026.10.08.06.08.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 06:08:40 -0700 (PDT)
Message-ID: <09f1f11d-c269-4cd9-9016-dc8a6d8cab18@linaro.org>
Date: Thu, 8 Oct 2026 14:08:40 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 28/74] media: qcom: camss: vfe: Add planes identifier to
 struct wm
To: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>, Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>, Keke Li <keke.li@amlogic.com>,
 Richard Acayan <mailingradian@gmail.com>, Hans Verkuil
 <hverkuil@kernel.org>, Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
 Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>, Robert Foss
 <rfoss@kernel.org>, Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
 <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-28-ed985aefd611@kernel.org>
 <6a2df7c7-274f-4620-8a56-31551536c49a@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <6a2df7c7-274f-4620-8a56-31551536c49a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/10/2026 06:56, Gjorgji Rosikopulos (Consultant) wrote:
> Hi Bryan,
> 
> On 10/5/2026 8:13 PM, Bryan O'Donoghue wrote:
>> Define the number of planes a given IFE write master will write as a
>> data-field in the WM structure.
>>
>> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
>> ---
>>   drivers/media/platform/qcom/camss/camss-vfe.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
>> index bf8dccf4c901e..8bc07fe7798e1 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
>> @@ -101,6 +101,7 @@ enum vfe_v3_comp_group {
>>   
>>   struct vfe_wm {
>>   	u8 bus_client;
>> +	u8 plane;
> 
> Can we change this to num_planes, plane is somehow not well descriptive for number of planes.
> 
> ~Gjorgji

.plane denotes which plane not the count of planes here.

---
bod
