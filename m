Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794811191;
	b=U+P6NQo5sjIkX8cwBhyyX0fDhlnp04l5WMkStx6NgR6MXL+j6eziCUuSD/1wr7HvkHzh
	 MWL8EAJpizcoFYLwmIqPa89HRNljaOEHbyu/HWYhA60inOLU8qm/I7lRa+00tW7h3dzDY
	 34McWRb3dQUC/fLawReQ4+uX0H+6ykGLd8F8JnyCQ1vc4/jqfMlVbuW9aijLd2wPvtCv3
	 xC6Kf5xAAj/tfW4OcflzO4OAWGfS9mV/ihWQRnhRqEow75XKxmrjVtggcXTplVvpP7meE
	 xIi0NgkXja0MLeEC2TmOYg3wI9FOfQLKzxLmQLjIRMyNvG8JToeX3ZaPsxm0kNeaWKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794811191;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Uwe1KYw1P29e1DCVb9MjyF+MXhbVXhW/CrTXu68G5dk=;
	b=iAtzq6iKvHUEk0s3my8z7CWhBm+XmkGxSlGAnijiFCEIpJrIIxZiZ0GBrxZOYq2x05QE
	 UQB8rIc6pgKtHZfHWs2fZMZbXjLWbh4+OspA1gCc2Q7SfdTajEykF3kpccPROMTq5vNg+
	 ipwQhVW8p2PJwFXrRreLyv1GGrO3OqG1sT/bt2DF6UuQVCK3H7WB75ysqATk/kX+9nEEM
	 f9L9nLiWJuDbaT3MBLRLpOTzddjT1/iXyBwkehGYSGyF2mpesaLTDoXaeALgzraf4CRv7
	 1dzOwkraX2YjG7BjS/fZqd7ZQeqouFoX3zPZ1uB9H6L3miME1Mfdk5gIrXvgd91J/4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KccI8a23;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X91ZcNno;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D985606A338
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 06:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D985606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KccI8a23;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X91ZcNno
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LZvm1321001
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 06:39:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Uwe1KYw1P29e1DCVb9MjyF+M
	XhbVXhW/CrTXu68G5dk=; b=KccI8a23szTMbu2QuoBOEIyxSw8xRhiQsWZt+YWM
	gJr6Q+7cDA0uZRq301gg1OcPsNktR35+u+olq64jhgCdcbhDhkUIM5q/1w3HSSzt
	mPN0wgGtpP7EvRPwgnpjAOcchvltQ5N9la0u+G4CBF6cb1eyAHkRX5gh5sZ2KbnC
	QUH75P9/8S+AXIv31PqwTDyQGYEVvAcasvcj68WpyMItV+kWSXiciVxGLg9h/ncE
	tat7c/WacjwGk+qYkFb+wyi+u3m/+q7o9V1yiaYpvYrhIsByvJtNKW1VvHe7hqic
	ViY+VwHU8wXZao42aj7krdea4owxpl6DVTuvXhZFMkn5hg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhman3qq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 06:39:49 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9907539aff7so2570065241.2
        for <linux-media@vger.kernel.org>; Sun, 15 Nov 2026 22:39:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794811188; cv=none;
        d=google.com; s=arc-20260327;
        b=Uh3qdTH6MXdGPUl+HWl9zn2vUF2GYFhLecJgJpnuCyvnT1cM7lFyxeQKQERTHt1ENk
         F9U26CQdvFg5M8NwGfxhOQkQdGU06jsRyaVAmP3xmWf535VDh2tQ2CZZz4VhPnQCHLJF
         sbpBpRqlaI1uyUPc3i37ZcHnvhWOIEQuD6UTctJT82caJJbYAZRVqJcjE0S0iAqqdUMO
         0tKd2LKlByPpj46YdJeGHVqj2RLbHjx/6DgHbi5U6rhrrxd6AMtfcVbmvc3y1qw2s0Me
         lrNiP4uJZEWmkvZRUveMHhbOlx+6zEQYA4m0T+QFkyJ9OlrN1WSzsHRNIoE4SQViKBMM
         Zqdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Uwe1KYw1P29e1DCVb9MjyF+MXhbVXhW/CrTXu68G5dk=;
        fh=unlewqrhmDvMv0DmhONdKcsqms4fajmtPWAPtXsiNew=;
        b=ALePq8D/2QlFyRHBbqJqFvWocT1cMJSwqHCAsS6AdgYF6a/is/ZRfydgWR3pqr1gCV
         +p9oib9687Zjuk4weamCYdtd11cGQIGqauaMl3lxdXudLLFBAW5wMRbg8o2glXy3iCSl
         eFvDyQU+zO/dCZsjrJZjqm60b5UkWac9A2Sfhb+Fat1wum9Jt6yGc73IvF516lqiYTfe
         aOfHJqAa9zykZWU4oJ6a/FznfIjg1NAS6yjYoq8z3biU+uoa4oMUXUX/E84NV4RRJcFc
         zOqSfonxWpq7I4emHAgpRAKHi8wyQAdMCIXi66galEkN3xX39oUVUJsUlotA7T9zUw25
         BovQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794811188; x=1795415988; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uwe1KYw1P29e1DCVb9MjyF+MXhbVXhW/CrTXu68G5dk=;
        b=X91ZcNnoqmYRaR9fw5AcAwuOTqOGF6u/nl4tfg7dMwf3ZOTioiNhtxpCfRSeYxxyXY
         NnqzdlC9fN0gDzml5e3FYrBKura426jYCnkYrtAmiBb7mR9ImRgf5kvi1qcgaYSTsNkn
         Ac3wZ9A1tYBfTj1hOgM03MUlro94ojHr7FeYTXJYlGoaFaaVc3Sz9Obb35VS5y+DWv2S
         O6cG7xuEbwlQt06LD3X+mmcWP9/UVqT/NOiwX8X8futD/Gewr4fIQSDM0Q4BxcbZnBVy
         voE63Rev9JBkIvQ5sANjv9+baXxXj7ggjTZgG/8jfNAdqtYBRY+uv1exOms8JsZ1JW/+
         UL6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794811188; x=1795415988;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Uwe1KYw1P29e1DCVb9MjyF+MXhbVXhW/CrTXu68G5dk=;
        b=ol2JkGXAriqOjoAQXtTr0AiYuKqVax/URcNSYTu06YPNCu/sFQ/FU80cIiMJWZZGQY
         uTaSVOotHYhc3K8ibKGT2aHQka84SFbf2JpQyOOhvmmjzmrI4IEz7lcmD3rw9Xlml1+X
         aoh0pwsD+OuJKAC6fUOZptb4ywed4pg99wOTVyk3wdTYoFJtPdTxfmdbS2EvQ3wzzzVq
         FP6hIWqN/b4ZOuOGz068567SrCfx/sAieMAfuWxsHltjQ2BGqRwzgDHVSV5q/ox1/MIt
         8AdQcnEyLai/aWo9EdHkLov0XbZYjafW9u8p6+Czdt2lq70cGwilsFIEPLh0RsnMLQip
         2kBA==
X-Forwarded-Encrypted: i=1; AL+hErFy4OyRAfEU2T8F4DvRD7hVLZvujGMJ55LlPpJUAsXWeOm83SeVx2nclSRIbtxZqs5bk/ZDHhLxvX5EOA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9B8AP2rlz/kr1bJKy/RwJ/NKtvn6pnJ0aIpoOjGbP120k+ydSD
	ZloyHYc59kcfnE2MvoeLXO+HmS1AgioKUnH0smC11iJaeS4NIKcHA7cNyEnI5jH/r7Ao9sLCBNd
	4ySiR4PheYjI2AxvNH1q6EHYOOhPGDB5O1VtDp0cpiUxCtRiIUrKKrYYYnjLQC7wVgq8oWDY4O1
	6rAoai6txMy9UM7RLpiVMBneUTm/ZmcaIrMy84s2vL
X-Gm-Gg: AYBFou2DKqJc5kFO437f/SOHz4TnVSy2aFxhKNbpRZYX5wYt7Rw707nd6+e1WM+K38h
	mSGfNpgAN2GDh2x6j1UgvWK/D2oPcrCbSpLAmuFEfbzFMUdgP13/+FIfol3ibUq0HImr5LXRDwd
	oNLLHKInNF99SgBiH3cu2owT37rQKETSjDXKBtRmQhMzGj2IMw2rAUP8foDsVrYcCXaUTivWWLu
	oGz3Nt5JJsEM3UBSQ==
X-Received: by 2002:a05:6102:c86:b0:7cc:2fd1:7122 with SMTP id ada2fe7eead31-7d64d76c2d5mr3162547137.18.1794811187961;
        Sun, 15 Nov 2026 22:39:47 -0800 (PST)
X-Received: by 2002:a05:6102:c86:b0:7cc:2fd1:7122 with SMTP id
 ada2fe7eead31-7d64d76c2d5mr3162538137.18.1794811187555; Sun, 15 Nov 2026
 22:39:47 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-10-8ff2a11835f6@oss.qualcomm.com>
 <130fecb6-5372-44d9-8261-c3ac88248631@linaro.org> <ea2dea8f-e696-4e86-be9f-248cb6ec86b9@linaro.org>
In-Reply-To: <ea2dea8f-e696-4e86-be9f-248cb6ec86b9@linaro.org>
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 14:39:36 +0800
X-Gm-Features: Aa3M54oy1Hdi3jJI0vYcKhvRYWOd_gLd_nvmiZaADn1RpRApqiz9QprVKg54Urc
Message-ID: <CACbMrhqnjEhFzu+Y4OUoNVv-XhZce=cjsuFnUJNQD6FMN_ikRA@mail.gmail.com>
Subject: Re: [PATCH v7 10/23] media: qcom: camss: csid: Add support for CSID 980
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: R026Qq1Gsa8IRDSyJyjZh9pPTwVmQMbX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNiBTYWx0ZWRfX+wodJ3tjAh6Z
 IfptqaZ13Mk/Iitic0O4ZbbK8clfer5jx6YoCvxjkozYP6NVWL64niiZI05wtaYPm5o/QhXE1yL
 BwdVuYoPlK6zUUPUaDFu9jwmHDWwob2zdrC6Wgr5rDjNMnyW3iJjNuU73nxS+KiAN9shX67eflT
 VD1pX6sn8CHpO6x1WKkU06psgD46iF/gMaaVK8Gh0gVHypUXpSlmKI9h1vZU0JjQCWZ9HtfibWP
 TZTCx1IMnVmiCNDRq57DN0fN32Ik1oSinZlfnCIaOS8c5bfqXwLL6q5WTcNMBhOUp073dDDZNxv
 9b+m8OVq/mEwYXkhrYTo8RS+VVGMkurVxSOYuI3RQD2f87D4l7QRn6D2zfwhL1ibDriyOTBw7kW
 cGD2+CtALj1UKVyvLXVtx0fqgjLNbHZ3lZnmUnbD3/Gaa2s/jwBTZ+/J4Zn9vzHtynMo113urSy
 cbIQSx47kEU4pYcQcqQ==
X-Authority-Analysis: v=2.4 cv=NdhzRGD4 c=1 sm=1 tr=0 ts=6afaa535 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=f4uaJoA6WFbKVHIvzf4A:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: R026Qq1Gsa8IRDSyJyjZh9pPTwVmQMbX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNiBTYWx0ZWRfX+BJi0Tuav2Wg
 ca0OcsyYOUco1i72D4Zg95+RKn2wiapk9q2+2Z2uybIP/va8h37aXcqum54Lzb61N+jkWXOglyn
 YW9t2uIvPSpu7JaKAQbyEXUmCiQuI3Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160026

On 11/15/2026 8:16 PM, Bryan O'Donoghue wrote:
> On 15/11/2026 12:14, Bryan O'Donoghue wrote:
>> On 14/11/2026 11:29, Wenmeng Liu wrote:
>>> +            for (k = 0; k < CAMSS_INIT_BUF_COUNT; k++) {
>>> +                __csid_addr_update(csid, i);
>>> +                __csid_reg_update(csid, i);
>>> +            }
>>
>> Why does this run twice for the same index ?
>>
>> ---
>> bod
>
> "run CAMSS_INIT_BUF_COUNT" for the same index ?
>
> You don't increment a buffer index. How can this be logical ?
>
> ---
> bod
Hi Bryan, CAMSS_INIT_BUF_COUNT is used in vfe_enable_output_v2() to
queue buffer addresses into the AUP FIFO.

Based on the hardware documentation and our local testing, each AUP FIFO
write needs a corresponding address update to take effect. Therefore, we
issue __csid_addr_update() twice for the same port.

You're right about __csid_reg_update(). It only needs to be called once
after the loop. Will fix that in the next revision.

---
Best regards,
Hangxiang
