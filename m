Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302CE3DDB04
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 10:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785408909; cv=none; b=Kc7dQLoje5mqEEWj9CnYXXs21bl23XLJWZMZD9LGY+ecM553Rr0OVsS3GowayOFcFh6+bN7De9kzlxU5iEOSmh9OFANfGSWX6aSmoSwzQA09YJkHBOCrYtU+2GULd1agY3llqhU3iJ+o9MZn4ihoRMxPPxec91jzPAEg3G/huPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785408909; c=relaxed/simple;
	bh=H1G1zrd3Sxftnuo0Q9N4COzqTspcIFH/Namcan/JP3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rJ8hvo86lp+1bKoXXv0XC37TYWkLB80l5uPihiAGKJz88oqSkXbHM9WkIyQAIrz2ZUMyOxHNIz/ikM+BquXOsUQoOBrQFz2YG4GlPvSXgd5nYt/hYcd3MQWbpqUN92D20OrZ1ZOAVu4ID7irEPtsQbgvts0Eahu1EBYvWnqvQtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ylvj9Azw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j+ZXakfQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ylvj9Azw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j+ZXakfQ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UA2fe8735495
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 10:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N5XljM/bgrjEk1sGZPvuw6CNHRwZYnTArM17rAcHfhA=; b=Ylvj9Azwutve9/WQ
	K+ftXz4zcTeERQjp0290hzgPS7BY3McmAcB3hySzx3rUlAStgNe8M0Pli2YLoff6
	/rAuBUezL2n92XEd3Id4BEaC68onEvKBdwdEcX16/zYZt8Egoz/y3MCKfqPYcV7n
	DkNeAZilEIrOwpXWaPMEhd6L6sH9eefngMm3mC9QkTrGOJ4VKQsA8RdBOGq7zoQm
	RGhxS8jmTRQOc7nOiLiIuWg+ydOBaeBEuu87KEqvozqd9yMb12h9cUrjifV98HFR
	DA2Z4QzoWuytpAYdQ86pAvpbU6mI4ZqaUN+MwUV/1snyQgxYwgbNYy4bHa7fTBCH
	G6OtFQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr4a2g9je-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 10:55:06 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ef4a54f86fso3876876d6.0
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 03:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785408906; x=1786013706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N5XljM/bgrjEk1sGZPvuw6CNHRwZYnTArM17rAcHfhA=;
        b=j+ZXakfQXhbLtgXb1zRl0l8DiyxkEGZ6RUUVKtnhewqsoipTfNbMysECCuMR2iCSFP
         PQl+EsYY8QVmaZdW+MLfXTUu0ppnofe+iwXj3XdIH36D03rSMJInbECJ4OgiHDkV0Wu9
         IIo8KgEL7F+fYjEPFsZzyhdyGNMQ/g4QbdW1U6tJo5JlENXbnbKc+/fItpzo3PCVbM8X
         1iWQtQsKsx/rG+Oi8N1l4nNovbjdjUa48Rjdc28hPa+hxl9P1/9BOHsth7PcpyNiLsd0
         jNFOtBxSDhXPEXKKa6SzoodRaZSH3wlTxm6mkIv8YYxqG/QLTBb2piQ7iJkVxCveT+Fc
         Uanw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785408906; x=1786013706;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N5XljM/bgrjEk1sGZPvuw6CNHRwZYnTArM17rAcHfhA=;
        b=EAgXypGTrh/MpYuHkUocGzwC/eaKDv1mU2VHeQCpvE4tAl7X9gDslVBgcGKCKzAAW2
         5NpRqhjK2rWtHMOTB3Vyz3EjQwHy/c0Z7Kqle1jS/pdY+Vzkt7USWLXfYHf3D1MHU2nW
         +ywk8sB9UYx5XEYuxRFQKuGYuuUsek4JZzuvTL5aXkHxkdyIvczq8QcDhVUf9dSHI0GX
         0cQ9zIYjAaJ92xnqFoD8cXwBLrFMNWV2FKwskeZCJSQhZvCtnGSCbV2JmrZmLB1az+zs
         XdvuaDDiXUJI2xVKw4jbaA9ODwp0mVTGFHkAug6PFKwHajNl/xZUrQcXyAVRetwq5LVs
         mozg==
X-Forwarded-Encrypted: i=1; AHgh+Rq8cEEJ6Ozirf4ut4/H771efTCCfsxzkniFESq7U08zlGrIdbDYMfDZyVGvf4JiJnIGWvJmM7RI/TW7SQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyopreUzulIcBFMuA2HABG7/trXe4hR7GJFIgjAFoPNO52t+EAY
	8LKMpiGFerDs6iWqndkAnX5YBbOqlbEysA52nrcdHViQBNH9SVx/5z7HBTuFI4QO70jswBlld/i
	ugT+SoIjlNk7WFYWTNOj4Ed0Av7Tm6Vx7pmJujg8X4T4XefZjTmh3GBIXF3r8H9Vxrg==
X-Gm-Gg: AR+sD11O40rw9M6UoszozCv/jWq8FQK99VjmWL7V7WI9RSqOzvPqFQLX5klC/8c9gWe
	JifjTl8EujmKGInWYNxBKepaHrCXtPw4oeZVBgn3G1GydKjoBstJgucgzPSeQYy1+oWpc6Lcj+g
	sfhyY2w1yjHxjvL79B7funvVWm6MgUzeh3JNu0EjyQ/xDoUuwlw0SXTeLVJ7lZuW6zrkBkTp5q/
	Z0nAb3JzjTuBtkGz28k+/VKtmT2kjs6ws+Ct3ooHZt3Y0tpc/7cL7hqT+g/LMtfIG3CQk+/AHnT
	0g8vQwUlPYIPU3udNdWwpf4Ujg2Aqbbz26XVvyzMgP/2WosXvLaiNtZGA9DjEmAqIfYg770nW/W
	/01SxnP9WZq9mdkpNmvvV1hwx
X-Received: by 2002:a05:6214:ca4:b0:907:87f1:3ff6 with SMTP id 6a1803df08f44-9083465ef60mr30182666d6.0.1785408906008;
        Thu, 30 Jul 2026 03:55:06 -0700 (PDT)
X-Received: by 2002:a05:6214:ca4:b0:907:87f1:3ff6 with SMTP id 6a1803df08f44-9083465ef60mr30181986d6.0.1785408905448;
        Thu, 30 Jul 2026 03:55:05 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a07cb79672sm538207a12.13.2026.07.30.03.55.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 03:55:03 -0700 (PDT)
Message-ID: <8744db31-8d26-4fbf-84ec-2c8562abe327@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 12:55:00 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v9 7/9] media: qcom: camss: csiphy-3ph: Update Gen2
 v1.1 MIPI CSI-2 C-PHY init
To: David Heidelberg <david@ixit.cz>, Frank Li <Frank.li@oss.nxp.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Petr Hodina <phodina@protonmail.com>, "Dr. Git" <drgitx@gmail.com>,
        Cory Keitz <ckeitz@amazon.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Frank Li
 <Frank.Li@nxp.com>, Kieran Bingham <kbingham@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260729-qcom-cphy-v9-0-1f8d9fdab037@ixit.cz>
 <20260729-qcom-cphy-v9-7-1f8d9fdab037@ixit.cz>
 <ampyfquk7cH3oq1L@lizhi-Precision-Tower-5810>
 <f378a69d-64dc-45b9-bc16-b33d1041e421@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f378a69d-64dc-45b9-bc16-b33d1041e421@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pWgAcZdK1EkTYXyVezBxxZQje0meAuyw
X-Proofpoint-ORIG-GUID: pWgAcZdK1EkTYXyVezBxxZQje0meAuyw
X-Authority-Analysis: v=2.4 cv=IoIutr/g c=1 sm=1 tr=0 ts=6a6b2d8a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=E6sBKzCaAAAA:20 a=gjA88sGhi7DxmjppWpoA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA4MSBTYWx0ZWRfX7A6HJiIcDZxZ
 QPTAK3vjl+LkTBtUirh7qe2frev43j8gUGpMRqN7qImxXBzeRfZBiM+jULhgwUB3KbCpv6XZA4J
 9WDA4G+YhUWwzE6y1frYeaIZZBf4oRFSiPXykupci4S1R2wl5PWSHWg8KOFGIX7SFPgvlAQG1bF
 2IJlySYy1DBCHGdMPQANldI+iknowKKVAe7k8It1AJXxQUJKZ3H2AiBBmVoAbEZKVWalw3PBWz4
 Zt0BU4yPC9d2oj9qV4/HbpvcwFjeM7qWJ1M+Kh2SH0hI84vbt4MWzzpsIM1BRzhApWVqpF9tSyJ
 vb0CXD4IqDeNMq0UaAEWatWeT3huZXAmPEbuSOHggYR3KDcLmLJaSE5wvUZH1CxU8q1MAMpvNyV
 huzJ6TthsBcM+1dVMSTOao1CqgToDtHApTAivIrs/KIDR/ZTIYuSYeZSlnKZvTcnZXHeDTZZHYF
 mhsIcKJmTl2wP0Wr25w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA4MSBTYWx0ZWRfX+gAOZc7h0E3O
 PipJrThh8iPAAfu8NN48c8R6J4apD46SiE9kGCWyiOXAuCCv0Mp6nj0m1SFNV3xcz+nrHHRvUhv
 S+8haqlwvoJn1+/gR7e7hJejcg5hQUc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300081

On 7/30/26 12:09 AM, David Heidelberg wrote:
> On 29/07/2026 23:37, Frank Li wrote:
>> On Wed, Jul 29, 2026 at 10:20:02PM +0200, David Heidelberg wrote:
>>> These values should improve C-PHY behaviour. Should match most recent
>>> Qualcomm code.
>>
>> Any reference? where recent Qualcomm code? do you know the real reason?
> 
> That's a question for Konrad. This improvement was introduced in the upstreaming process, update taken from more recent sequence.

It matches the latest what we call "Hardware Settings Reference" set
of values, and happens to be present in e.g. this tree:

https://github.com/sony-sdm845/android_kernel_sony_sdm845/blob/lineage-20/drivers/media/platform/msm/camera_v3/cam_sensor_module/cam_csiphy/include/cam_csiphy_1_0_hwreg.h

also worth noting, 845 is csiphy v1.0, not 1.1

Konrad
