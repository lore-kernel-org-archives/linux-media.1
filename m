Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792450576;
	b=oS0odOpp8G01sBSCXW+baG+GAftQJVQnxMrbyvyAXtLX8Zw7mQtniazfDs/tBO7QB4hE
	 Hz6q6W7w4mX2BKkxhNChHONwp3b6ZywUN3MGkcUYRvjIpUbUWKjMfQiaDBs9AWFyoMkED
	 LezLIbzPvCj003CN5TNpgfjdCfBI++hRX/ztGHGjYdI365Ry3HalGDdx+gy1ZUgBK0GTs
	 76IlCuBWPw7t7CCwNAdDHlSEZdknAd0OYPHS7JzDVbUUmsgium9UqyUdGLuqw1v8uzR+f
	 p1c8/x/jMNb46sIISs41/JcWDu+97HH4I6PTeXi0VQlQYFu9MqInH8jrV+wJtTZgkaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792450576;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7+vzN5LPoKjbpkSA7Pa/WYBwwwpqsmpM5rGqvoZF4Zk=;
	b=GqhDQmzbYIy/yX6tgwF/xigV/UWOJCCmDEz7uxoE30PBwkCv5BJ8ZAIKQssGkDbKM1FJ
	 vkArP/0Iyc3dgcSHVCfnbdlObXXFoDDjxZZfKmbfAhvCWZKW21loMLLMZc+XhZkQ3gb/K
	 Vgq8Ja/MeKI/wcc0dJgSGGu57ZQlEY/iJTWX+kAU2UhtTzSxdxO+7b0AgK/x32TYWWTUI
	 QtUq/e8r8zdNLUUYDsiNdatujJKmebR/sRgVGEg1JjL90HH+XNFxw2cEUjDnJmS6zF3LP
	 P7vOwgUWh70JP8vHb7Kmudvo8b2yOLLRFRTPbCXnHDCuCHGlLfZJxT69e0ga2nAFeKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPD4U1pL;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="RM/6oeEu";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C716C606A31D
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 22:56:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C716C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPD4U1pL;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RM/6oeEu
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JLZPRq836428
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 22:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7+vzN5LPoKjbpkSA7Pa/WYBwwwpqsmpM5rGqvoZF4Zk=; b=ZPD4U1pL9YDcuEgT
	jupiJVi6G4tVmwh7ySlS2n5pvnbzewTfF6+YGf1q0twWg0NQAIIyUPEkMAUc2Gew
	jVVZZIZGkeeuHaDGtsPymIgLUMwLUcBhz3HZgEd4QubCoUEKxyWszm8uJ4ubLm/I
	u5dguqWtpJWlFykb+e+QXZ4ukLl0VND0s3L+ZAKFjd4w9hJDt2PG+sgs24z/WzHc
	pp0JOB9yK0lWVIsdbvFkrIs0p0EOlOlD6wu5oINLtYDxBtIQo+avzImffnsnSjZI
	CTsNogRzC/5cBNHeU3QRz20S/BMSrtXhKArXbAr9sk/qqGV9KpC4DeK6j1nfjb99
	Km8wOw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf47kmpr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 22:56:14 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso5046501eec.0
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 15:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792450574; x=1793055374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7+vzN5LPoKjbpkSA7Pa/WYBwwwpqsmpM5rGqvoZF4Zk=;
        b=RM/6oeEueDtBfSl1qWx65vX3YEajsp+K5oPstSZfbJrJ62StbRaFmjnAa0njkwGqsQ
         VAWAfxhuxuBBlXiypreh5iG7PjLDh1wOyZxM52Zdf2hVekH+Zzl8TNbGOntQfscKa0du
         kHwOeD36BLzDKXHdQLvQ9grcIJjCUUPp8Y7ntUM1afqgLtK4TGtgGbl9187JEZ/JBnQZ
         Efa2UlZ84Fh6S3K+UR74uU/pRP90ZK75uzBhrEqwJJniMGcqq0HWfSqk9cDwEb/m0rBi
         EOAkVXhgF5warnC9+IURC3oyzjimxRKNSPECN6tClhubsa400clg/qZh2ckuSY39Tqih
         hCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792450574; x=1793055374;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7+vzN5LPoKjbpkSA7Pa/WYBwwwpqsmpM5rGqvoZF4Zk=;
        b=yaWIBvBE42HfXFNsBq5ZhFkG0hWR0F++abNFyFfLvfvBaaXbRnwIOU2e+tYBT4aQA9
         nxsCuNn3QPd/vsi2YWFCRjZk8Pa/uR8Q/9Rk+Ayk4ahfhGA73p6EpURMhP/OC3YahNVG
         oN65JjN6uBYWhPJk0N1lGu7Rjko6+WK9NAAXwdHJiXikjTrnyjIj1tvhZy2VASo8R2fe
         kMl3yQLFPoqLR3k2wyfOqhevNBg1OkFd8YO1xfmXvDUWkFOaLTHpzby5AVnzLjqPAFPW
         XzUqio2iNVGDs0BnZ5rDyUo6L3p9WlSF+eT8Xlm4uPX3+2Xtu8aY6D0EhWIdItVu2ybG
         xU2w==
X-Forwarded-Encrypted: i=1; AKwUvBzxt8g+TSGRxvsm6YrK4ZSUQytY59AHJUXSn/SDzYbwZjVzq5ToQXWBKuZ211XJ3URQTEIHcwB6Ffse0Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYLAkT9wZIUSm9IdpFTY3jngEBM2CxfdIZkK4atCaAhvMnVWZg8d
	a9LxX4GxzxYk2A1/qcWx6OpwB3fsXwebHXqoyBQRdwUkf95UWu6DKawjJsYMIaMVXmzDLl6L/b5
	L+fzkhX+klCO26XlbIBlOU2xLJn2pWn2QNfYCk2xnrWOvbxvnQFLKAo5BZuCosna7hQ==
X-Gm-Gg: AYBFou0s+Pd40SVfcOVFBYJwlZ5R7Ir6qHiKL0mPDxhfTrXO0thGYUCV41QPcyOrmIU
	Q+6neZSGil0t44LB5WHkWQupnKLJD1L+NpYfwDAu7ROr80m8bEf96hVX2Yjrs/hSvqjQjMkBukm
	wDFdAeshU6Swp4cdv82de3HrhXBsF5bo8BYAR+Wu7DaNTdwlxhgCds7DTnGquxMBEAoDewm0JrX
	n6WUwRRO2e5zVsKOWuh0VcGIwx8Huqcads6U9UZCKXVETbeirxgx7BpOFMHUFurY0OVT42xJeJu
	kp3qE9KTrb1iTrMllu/27Oyps3yDWadg3VclQ742+rhDL7rwW2NteuNDU6ToBYENOoqZgHRDsts
	qxn5smPmzeOLBWHY19DF/ogxLhEdTSEKD6SkQt9/UubqQTiplAtXg6hiE
X-Received: by 2002:a05:701b:4546:20b0:16a:8ffd:4977 with SMTP id a92af1059eb24-185136cd2e2mr12257693c88.17.1792450573740;
        Mon, 19 Oct 2026 15:56:13 -0700 (PDT)
X-Received: by 2002:a05:701b:4546:20b0:16a:8ffd:4977 with SMTP id a92af1059eb24-185136cd2e2mr12257661c88.17.1792450573198;
        Mon, 19 Oct 2026 15:56:13 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa411sm35737062c88.4.2026.10.19.15.56.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 15:56:12 -0700 (PDT)
Message-ID: <bc790885-bb5b-4dca-b5f7-5c338b809f21@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 15:56:11 -0700
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
Subject: Re: [PATCH 0/2] media: qcom: camss: track PHY type and scale link
 frequency for C-PHY
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>, david@ixit.cz,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, bod@kernel.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        bryan.odonoghue@linaro.org, linux-media@vger.kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com, daniel@quora.org,
        konrad.dybcio@oss.qualcomm.com, christopher.obbard@linaro.org,
        alex.vinarskis@gmail.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261017035221.3816464-1-anusha.nandi@oss.qualcomm.com>
 <31bec5eb-97e0-4667-ab6e-0de662f97633@oss.qualcomm.com>
 <26e2a1cb-d792-4ca2-8530-865ebb887eb7@kernel.org>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <26e2a1cb-d792-4ca2-8530-865ebb887eb7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: E9jLHs7QUYrjqRDEbBD3hOCUyBP1teCJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA5MSBTYWx0ZWRfX9RAPoGls2a3G
 GpnNtdTG7O+8n9bGABPBxLmtwar6PTW6cyhYgi+zqO54eRq1WeFd8PyKBWSXhiW959TCeI7fmwA
 ZG0o2o8bsaciS2P2lrBhSNjinY5zQ1ZmNU4cfwIrFcuefeosfc97Bwnbr1hlQorvKjM2abJD7Js
 c2yxajfDlrX7xAoskYE9mQ32qUqEPAx4hZjDn8nZN+l8Fh2XxjJI+IvDQ511tj0jw5LN/OiKL+P
 EXGHeWo8VDmwLyrVwNBY6O/OmkHdUnKtUKyKBs/MwnAJ+kLVv4DXFco6lPJS1tIDkWWEF/NfVeD
 /I2WLnvhXQQxdBe3/tGhMBVkVU0AGsnchbEzJRksIf1uFa7ANI1CzeHBzFOnbtk6LzcGQSeC7sZ
 W7Q7QM8QUoOyC85pB38GuyKsicTuyMI/2LMzSJi+NQPek/60uL2O/0B3DD7Ahsu28YyzcztEurp
 bkTTyja0RVBUAaGKOAQ==
X-Proofpoint-GUID: E9jLHs7QUYrjqRDEbBD3hOCUyBP1teCJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA5MSBTYWx0ZWRfXxGjYc//1llQy
 XLjcG5VxUVwOvus1sNjW6k8YHPWAs5TBefYB/i5nJBsmGIghift+pOKpPt/A9W8uvm1pdn9x3RB
 dtfU72uuEwp5Rg0X8EEdgwMTenVneFM=
X-Authority-Analysis: v=2.4 cv=cLt1IVeN c=1 sm=1 tr=0 ts=6ad6a00e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HsCFRf_u7LXHOK7ic58A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_06,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190091

Hi Nihal, Krzyszto,

You're right. The driver itself does not depend on the DTS. Apologies
for the confusion.

The Depends-on was included purely for testing purposes. During
validation on sa8775p, qcs8300, and sc7280, we needed the corresponding
DTSI changes to instantiate the C-PHY consumer nodes so the driver could
probe and be exercised on real hardware. Without those device-tree
nodes, the driver simply wouldn't bind on those platforms in our test
environments.

Since this is a C-PHY consumer driver, the DTS patches are what enable
the PHY nodes that the driver attaches to. They are a prerequisite for
functional testing, not for compilation or correctness of the driver
code itself. The driver is self-contained and will build and function
correctly independent of those DTS changes.

I will drop the Depends-on from the next revision.

Apologies for the noise.

Thanks, Anusha

On 10/17/2026 10:35 AM, Krzysztof Kozlowski wrote:
> On 17/10/2026 19:30, Nihal Kumar Gupta wrote:
>>
>>
>> On 17-10-2026 09:22, Anusha Arun Nandi wrote:
>>> Depends-on: https://lore.kernel.org/all/20261017001116.2318647-1-anusha.nandi@oss.qualcomm.com/
>>
>> This Depends-on is in the wrong series. 
>> The driver should not depend on the DTS.
> 
> Good point. If dependency is true, then this patchset is just broken.
> 
> Best regards,
> Krzysztof

