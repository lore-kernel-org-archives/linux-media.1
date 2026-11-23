Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454733;
	b=ynyAsTwf5lf9c33ec5zB5swigINUogBbIdFzZZoaqaA4Iegn7rE2M7vGStAjIuMs466O
	 LL3hzTkW6aVPo6YB+EW4/SwX5HDznqemBQEOvChGqizB/IRuFrDDfASJr/gT4ikT7FTl2
	 MagHL5xZQA15CM8AhTxuRkIiZnnTM6ARLN44CbjSBIvgKaWm477EpdYop5D7gdxQJ8TEO
	 Yo68iW5yIVBlJQOZolAmt9by3jayndFN7WNizd6LaJZoc2dj667Tfo7uIIzO8qHiMMchA
	 Axpdznx4H0eDTZo8b4Ym6PUHojM+W/gVkSHCSm6iWWJTfn+aLYGI+JolYoiuvbZ+bKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454733;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lfhg2+/rNBhkH2W0arnD3tR/lai12P2aVjqQX7vl+Hc=;
	b=Og5ypdhUnwJg+Sno4A5oitEOigInBuAerV4QrlC4cPZN0fKIEFO8iSkBESA2LdlQO4k4
	 +I7Qge4PE3yy5JRxFFVPtNbwjV8LU+bSX2zjwFc54cLzirRkAAIq2c+yofdItO0Tq+qPl
	 85M/zK9RzYGNpldidE+DyQDgqxMnX/wDPxE+0YhBrRJO6wTwkNwaeNIUpnepodZYC58V1
	 rdTtOoyZHHqfL5hDkFUHQo4JTZ7ZnebKwFPdSMoRAqL7p9m9bKBCvFAqbv3Q5OtWLp4U8
	 T8ghUBW0l4TjnIYwv7Ft93jpSKT22lFx5KWP0M+jKh7Z07MdmSDcbMq8c/qZfNzLvoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ES/btqeW";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IRw1kSt7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F40606A327
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 17:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2F40606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ES/btqeW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IRw1kSt7
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGnmt1861277
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 17:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lfhg2+/rNBhkH2W0arnD3tR/lai12P2aVjqQX7vl+Hc=; b=ES/btqeWk9Ry0Y4v
	sPoVsd4C6na0WcfUDwzbpyMtnHs5bhkYPybKr0Ecn5CNPpAnGtJ2KRoTSefgpWvb
	WhW4cG3J1iecCApouM0FOxcwsEPDtC/Dz+JZXNw+eJ+pABSjSMhYtz59XtGFdTeD
	d0fR+0wd+MQXKA//TVuDVjOYxcoUdchjCyvRjRsu/RcjF2KOoLQgHzN/jOWEUilb
	cY4R496mMi+8iksuU59eHyMhnG4+gSRDuR2YiBV6/Pwqa9Kqzw2Fp8Cfgk//Kqx8
	UH5imSinHWeiwAFLJ2drOD3iW/aTwHN3iVnrpD8swI+eDjvTGggOp7mbUBRauXCC
	Vue6Iw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a2hyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 17:25:32 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99af36c8b98so40414241.1
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 09:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795454731; x=1796059531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lfhg2+/rNBhkH2W0arnD3tR/lai12P2aVjqQX7vl+Hc=;
        b=IRw1kSt73pjEXYwJdclzKQgGlvG7nnxBJ/HytOijac9G7jNTPElk53F3x9kII9r1Yn
         CO1pum/eIjjS4OM+EZL2yMK5oXbpn/4qlTZcXRRc0Yl+oxI0h9qHAC5jdlUficg9L+qp
         LPyPVTBqvLJHbTt6VsipJ7gVzRfzq7deJC9QNLCfoC1HZHGBn46a4FwYH58yCrBFsn8Q
         9Zhm/+KWB1fy9sZTGLtklj/ImEvRizE5gMORGcpkuPZJRHNu4AgKNHaAJAauO4MO34WM
         WoyDW7p8Y3U3tMEmDrf4nemtv99eNd5Ban3wGfyGPenvxjjcRlVHHMS6lbB2WpON+9i2
         73Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454731; x=1796059531;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lfhg2+/rNBhkH2W0arnD3tR/lai12P2aVjqQX7vl+Hc=;
        b=ve6OR95sGh8BcuTAhUQvERnDu4HSvVz9XGh0UTh5kmyviMaUVcaS7NZ/KXLtuCOXX5
         A/n4zQKM0H6hkbJuPuV+2cUifqtEz4rpNSG++77LuN6LnVyWv/pl25uewF9Ncqqx80fe
         fEVrmH30G7U2UR22I9cridNAY52buEaxscHf0KEfZuJXoIyRR8+cLwDOUIR2N4kFokWb
         MIHKQGd6iHAvRQ1Zy4zK14d63zJhiaGYeYWSnL2akot3lOM1jd6MFUFpJMQUiJulyAeq
         QwIGoSt9VIOGB2qilpU46ZT1kVnmpJ/DlyQdDY7CC6OjWV9DOuoL0oh0Q69f9T9wsmEu
         giWw==
X-Gm-Message-State: APuU4Z9+bVWzvkB0ltAOLsItIJ9WpSNoHWOKE8H2oulokEYQcBxy2/os
	8hcG/pYOIxocUnVoUdGc0YT+bYjt/WP3h7T3N+epHzkLXt8tIAifv/erPcOEGEsDVrkSxxWNAAV
	sZVyKHsF/9mmPF3sLT3IsCxg3EVIAKV3Qu7xvXga5gLbojQ2oQirvefqNAWm8NPoRAQ==
X-Gm-Gg: AZFdTZfG9BOOe1Ewk8yagHuE1s9/OhU40ohTDnf6cnde2+VC5ND32exqG3V8b3xNOuu
	32H+wuAYmVDw93lQ7X43BEMO6fRunRfHbP/xV+/kXEBEu/yxmnaTExnM6M4U2Hptcsrd4beheuM
	0+khxgSHU1kC7gW/Oa2CfBqAyb6pqhdTUaAfqZnWVr65H24hVeL3p2PmaNZ/p/YjNpCsrxfk+zX
	dd1owD0hNUEQTsWqf/FqqKxXosiTgHHA9Y+Kk6wR2i4RvXbLErDofoUIYi78y6cV+SpCQYUb/Ee
	RFxneqo1yYKI2pZcfUczXDnJA1MKKfoq0oBQEqKI8Tn4WmjIL6UzJnKKx31fs/WtaU/tYxyDYIB
	dRBJ85C55B3vRdFCybSniLMwjOGXAUZ4RHc0PSpRz81MQ1GZBWRGBepRtp/sCo1ZNExsjxOM=
X-Received: by 2002:ac5:c00a:0:20b0:5cf:ad27:3a67 with SMTP id 71dfb90a1353d-5ee8af8d7bfmr7450515e0c.5.1795454730971;
        Mon, 23 Nov 2026 09:25:30 -0800 (PST)
X-Received: by 2002:ac5:c00a:0:20b0:5cf:ad27:3a67 with SMTP id 71dfb90a1353d-5ee8af8d7bfmr7450472e0c.5.1795454730544;
        Mon, 23 Nov 2026 09:25:30 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc679bsm432664066b.63.2026.11.23.09.25.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 09:25:29 -0800 (PST)
Message-ID: <97ccd0d2-6410-40f4-9c0f-c08931dbeb10@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 18:25:27 +0100
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
Subject: Re: [PATCH v3 2/7] media: dt-bindings: media: i2c: add Samsung S5K5E8
To: Hikmah Gumelar <hikmahgumelar@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>
References: <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-3-hikmahgumelar@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123152722.168879-3-hikmahgumelar@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2OSBTYWx0ZWRfX5sJH6YYHxq94
 WMwufWOWg1/86sTxWo5JBmHKAFl6FzR+YeK7w9VB0kSi/fVF/mGx+RWme5fnNnK0ovD0EIqkOFv
 s2wH0bB3f0seCprt1RBR1S7NLsCSPmc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2OSBTYWx0ZWRfX35wJ8vuCpHPm
 iJ44YnBhWdKeh+RbAVg8HMYJRUNilI6GHF8JsXgZIqPMdT4VU2wlrV2PEyls9LVkZUr1kg+1l72
 tAH26UkoYINmv/bd2zLDGGaeMy0/HIv9e9BY4SNMDXrraWKe+b4fpb6ige+tRYLvZgottLSB6XI
 byW8hqwaEdysxcdn31oL5o69LD16FlFzGaWH32EJdxkxu2Js3L2x0+G+PWXuvBADWIWo705YcXX
 D9mUKcMMM7sh3nRDmObczv7bP9AKONPkyUv87wsapO1eAU1hN3Cz7Ifp9Crnx9aZOBu3J/ud4qg
 FHLCh6SBkuD+W5awto54Yc5T6/BJt3z2+ezYbvQYd0h0PM+qtSgLB3WKmHRPlz7vwrYgcSCjB2E
 8D1OdsIF3D5wp7eH91oGNUHOlw2r6g0+2/MoAEXdBV57ANCMBoI7CP5wkkhUCHZVovnGsLvMFEy
 PcMKRvr67HHbeXUmbJg==
X-Proofpoint-ORIG-GUID: aWmNmHJYT_JIj1IRgcOiEnKJj1-EtSD2
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b04770c cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=2S1_hLxhzeHvXZh1LqAA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: aWmNmHJYT_JIj1IRgcOiEnKJj1-EtSD2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230069

On 11/23/26 4:27 PM, Hikmah Gumelar wrote:
> Add Devicetree binding schema for the Samsung S5K5E8 5-megapixel MIPI CSI-2 CMOS image sensor.

Please wrap the commit messages at 72 chars

Konrad

