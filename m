Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC21576ED7
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 17:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790097629; cv=none; b=ZwMpPlHsBcr3UXoCnckC4I2q/0+kJ6mRrQZ2EEglPz9a8hb3Wzd7xQf943ssq2trzHQXLypMs2i62TqAUxzuAHmSXrG/qrH3JWCROYdU/j4bFZdbjZ7vTnrUCWmwEaTLLL+hFnnzk54gbtbN3IBRspF6fXuC9lrOZ7kvnLAbYII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790097629; c=relaxed/simple;
	bh=ZgSvG6kKG9iSmJMEuAW3BWVeHh9wVylo4E2yoG96D7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sxYumpZsMbriTGTZFKEz7R8o9RqUJnfB1ssQw3bZwPjBb7qFpir3mxZHzDH0utaREQ8LT3YRJkLJHxMrWBb2S9l2TGIINuC2jQf0fPAN0/intWE3ChrnSG2lm0yy9CsaSgeDyBCOgXSsGjl/0MYiVWYV1oRk7MXdRXxRml+UZzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aLH/+QUr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JI+ao5BB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aLH/+QUr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JI+ao5BB"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjoei3952897
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 17:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oHqvINvN9nNOcc9oXioULCP99cwRQ6NA5NU863Z+Bug=; b=aLH/+QUrcKEdduB1
	g8hbwD/QG3Lz6Kv7wEz87IGYoHZhTkAbB+/26So2s4RjiWefqzBQ8ViVSPuVHA+X
	D96kFcu/jpSnnrhxwl37TbM/ebJsDd0HVHzNDafxcwS7wFd95Q2LRCOYzYr6pcro
	6ECt0jJZZSIf+t2R2J8+tJY6jJB2Sqly0Zycd2EFNzVbKhsqdy/oy+TL++8Gluev
	fedAW/8OoClqepQgz5usalXYgcRRulEOLllXxid86JjbG0rmHNsllFjzMQ9R1IsR
	6NK0wU4G1Px7lqTyZjqH96UXE1vMloDa5dcNEK3v131c79bjfkiXemDUqbKjbio1
	2dsWIw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufsqbtv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 17:20:26 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so193923a12.3
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 10:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790097626; x=1790702426; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oHqvINvN9nNOcc9oXioULCP99cwRQ6NA5NU863Z+Bug=;
        b=JI+ao5BBzSd488VFy9Rl1jEI4Zq3SpVD1Je6tCMGsgB0CD73NxULPh6uKgL6/oMBja
         0OUD9Staqf2e0xFX4v/+hqU5BxvGL200ATL9DzDpoJgKIAKA45ItL7NKEIoBNM0WGwq/
         +4ZlM5NGw2t6AJ6f1N3cSI3QDuDgmfGNcDWQbq15DGpPCURgwndUYsVDdY6cBZ9+Yytn
         ol378Geo/mHk7lqCxGm04vC4Z4Z75wgyohUWGumtnyCHyA4Zb9yVcdWRNUiX2Zq+o0DP
         pFL9PTjjMeDbninTIwaSFcj/ZKmgydwPq5vrC+mr1DZyVIhaySVURPOXMn+OgRd1+hFe
         3wKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790097626; x=1790702426;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oHqvINvN9nNOcc9oXioULCP99cwRQ6NA5NU863Z+Bug=;
        b=DEPfsOR6xXiiDeuri/3Xw01GETeC7Ca3al1YED7USIn7QbgshL1L0+TsgulvvzCm0M
         eaUER2ZdkKe3nPBefOV3CrGwrzSjszyPSr2XWiYMXkpwj6dSzgg2lt5tJfacXxZ404p4
         Fx4vxdm16i5EKNTZaBhn88IQtW3+kq5Issy2KrAJF7YT2kHRBHjCfPRsXWuNGWTY6yM/
         UfDosRAu7NnZXNri6QoUWIywYdVSrEa9aAc8d/GT77ujiloix/oOcg5aKN+NVZMmBYE5
         9JFO2ceoCc8iVfzi4NPLFlKav1JwgVMbQcOFxwSKmzvHa2SRaFoJnqUMZamE0fwV2GjK
         pvyQ==
X-Forwarded-Encrypted: i=1; AKwUvBy33fXf3BWRi2MITp4z0stzUjcNcVEse390WdDVZl9r5b4zg1y8Rt37nbicIBWkhMDV+wIRWG/WYsJaMg==@vger.kernel.org
X-Gm-Message-State: AFuF++kTfmv71qLpfM1Fx9VWSusuo5lN1ZD3wJiowp2g4RlfUIERDVFb
	1wCFTBCSo7Gam4P5nWAoxhBBoV7e6ORNxCctqAIWyXRkBZtxzZlX/AXNCZ4iGTvD9kGnYostjbS
	z9QPWv33RVjYra2js0KcWQRrVs/zDbhlMrAtaEa5w1WuM2Age7JuwtnMkM9I4nLqjHw==
X-Gm-Gg: AYBFou0kymBN5UWKkNOvzdBte0tEoTskT2Wg4zc77mGzAnHeCbVblvLQF3UsXNO4d6z
	DBEVGr4N9yFlFxOzvpi6/43hS6XmmmthpnORem0j5C5sd7scYMAYOIc97XtpeIHbTrOv3sl2PmU
	FJsJnsBS4T0Za4UdaUu1s1RzKOVbueDDegxi+ucXxcWbXnhtwmQvxqOzQWYJYGbsAWfvP+l4PMj
	mP9AKYg1Gn1sR4A3qDLBTxvI39JE8dwVSocDbvEQv9KQ6CsjBZefPMK2v8yybFJSAtiaSLcaZ5w
	HiN+sohzHio9UrPIcMagVycM9nIK0xbd/uYagWdemQY/hywv2/uviXb3romgSbDXI6z/iW9aivM
	IESk+qOiEiVJnu8JJzo5rfwLZaF0j8Q==
X-Received: by 2002:a05:6a20:3d95:b0:3dd:a006:ed90 with SMTP id adf61e73a8af0-3ddf8278bdamr129805637.38.1790097625359;
        Tue, 22 Sep 2026 10:20:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d95:b0:3dd:a006:ed90 with SMTP id adf61e73a8af0-3ddf8278bdamr129761637.38.1790097624786;
        Tue, 22 Sep 2026 10:20:24 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.227.249])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc756a1d386sm1295837a12.10.2026.09.22.10.20.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 10:20:23 -0700 (PDT)
Message-ID: <39ac1f45-057f-418f-bfce-917d968eb495@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 22:50:13 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] arm64: dts: qcom:
 shikra-cqm-cqs-evk-imx577-camera: Add DT overlay for Shikra
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-4-9b9596221cfa@oss.qualcomm.com>
 <ff798c31-48ef-4882-8ca7-5b4c8bdcf9a0@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <ff798c31-48ef-4882-8ca7-5b4c8bdcf9a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WGWl4eSPUcNBxUp85jEhmuiUYAIsBkFp
X-Proofpoint-GUID: WGWl4eSPUcNBxUp85jEhmuiUYAIsBkFp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI1NCBTYWx0ZWRfX6wEVVc3/rwBv
 G2Ey7lqr8TE5ykInUmdOni7cPjZZIulCCev2nx6ApGoCAr4MLLHBm2TYE9fH/gZncllfS2v+tOR
 DWw8D3406vddjpfNMotyjaN59Ag6Ubc=
X-Authority-Analysis: v=2.4 cv=NKBAaE6g c=1 sm=1 tr=0 ts=6ab2b8da cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ISK6p04Y8w1qFYbiysbuaQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=sGt-zapad3vFaLHLuqkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI1NCBTYWx0ZWRfX1gNhQfnRaR27
 /Pm8q+8GT6Co94YPuV1j9OLKAyXFFigHrstlg6kOHzi1L7K8Rys01Tu8b3fkGJ5ZkXsMCGP29UV
 7yetmW3o6Dixpp+3bushKCTM7vH9QFmm8q5KZrQKmmLMx0QcriFrOZtU65nVVTZjk5McKr1rLA2
 7pXNFsiraEQ16y4n7s3UU6v35SJqlbR8poNwsW406AHuGwrXTsP+W77O0uD0DVKu28C9PbGsSzg
 ZLmyIUYHwcjOx8ONCjGii197znX3rsd98C9rTEmcwHxYavGkLTvDa1mYS1Po1+ZMLIG8UZzgjcD
 usPQYiEUbW+5IppqFA+mcCaJ2mm+WTxJzcCEEZxifaCeq2g0hw7UJuODHXNZP68zxFym9CI+mKu
 OCxffNW7+peTYttVKndIdDRo/vIoh+HEQe9ISHgBE4dZ8Z5+qQsrmA8aoLvGWL7ETlnEYlQ14Vw
 Ki5Eg3nuurdgLXLdnNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220254



On 22-09-2026 21:23, Konrad Dybcio wrote:
>> <&imx577_ep1>;
>> +			};
> Please realign this vs the hamoa series - define a port in the SoC
> DTSI and reference it here
> 
> https://lore.kernel.org/linux-arm-msm/20260917-x1e-camss-csi2-phy-dtsi-v7-6-1a63eb35838b@linaro.org/
ACK

---
Regards,
Nihal Kumar Gupta
