Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABD43AFB18
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 08:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792224444; cv=none; b=LK1N+5ranIIIdKG6gg6Idfj61Cq23cPxviLu5RI8D1FbHtPY1Oxc2nD+IHA/bXAIcz1wggvqFIGBzw8h7Pz7GbvdazBbfoPIy/sGvzbfRb5VGOUgsCO85U8DfsNjHBgIqs+K8o/psVH7xMm1Exq4c4xSYLYl3QI5blroZFdxF9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792224444; c=relaxed/simple;
	bh=bY2jCeq3P1+EwwI8EHoEtrfZe2cRh12mwezenEG9yFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dz8c9h1JlTTqrg3ubTN5oduuGmQiQNnv58jpumUJ0q5zbX3Ku8CzzKJsJRezKy+1HDZDWaFSNeAXFDOTSavvHdqvCt3XLIolDbAwq/Fw/juXvh8qA/hiTU0F68fzOtCysYt3TqIuQjHT2HUVD3G49VpSf5fWiB5/XegYAPhO0rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WBzk5T7w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pur0euC2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WBzk5T7w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pur0euC2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H6oMMM1470918
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 08:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	inGKjpvl5VwXPVpSApZydZ9aNOUzG556wHdzVbdOK0Q=; b=WBzk5T7w3aje8HSD
	6XFT+IDo2+9Y7+pJWQqCdUM1FsOMbEdukJrGHh0ehRjwzvHG4gp6OvU4Vh4YXRgC
	+kKSggKsnPEB+QWHL/HqepKC6I7HwKj8yNaV1u6Tx+H/juRoq6kAyxTCpNE6xWkY
	AhvMB7GTxDjkMqGDcUMhVv9D66ULcdXG2vRCOiB9SH8Rcgq3HChB1z7ePrtuBF5r
	idvFy+5D1teoxfUybwB5tha5eCSJgX9puEXvde8XOb7QXsV+M4AfizMMpM7I0LbI
	oyyqLfG9c704tCsua3WnUrIO6SHISgNe7WV9aZQCk6vgFmoAiUU6NnzMQA7Qms3G
	VkOSkA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbxqfrsss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 08:07:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so172185685a.2
        for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 01:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792224441; x=1792829241; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=inGKjpvl5VwXPVpSApZydZ9aNOUzG556wHdzVbdOK0Q=;
        b=Pur0euC2TQersrcN7jUHgfilyG1h9PmZnGsptWgOCsLfn2blwZOpjAj73Al3S6u/Gq
         q3LbxeKoGHwWj/FrsTnWHMWONXgXcXImoKrOQgrS4O8TF1rp+ki1dqA4w/A4l/cRnsdR
         jZWD3c/bXGuykJPnFb/BfqrDhff2dhop3zI4GsEU4tGIm2e7AQSFocqQK3XP+YqKM7/m
         5MS2/RC68K1j3hLQZF1IdCGa0dA81Xffb7oFqhWqi/mEcKD5vSgI5u65QIN9quVbcHbv
         HtB/tMdsXkf9Y1QTakXrku51UbOg4JgQBldRFYbvc/Xrdro9V3/F3+/NJpUxGinD/UYG
         cJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792224441; x=1792829241;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=inGKjpvl5VwXPVpSApZydZ9aNOUzG556wHdzVbdOK0Q=;
        b=hqRHTRuVKx+f7d6dNBxNdfXDsxH2bXk+YzqtE8nv6Tmt1IVi1yOGSloZzcBTgRfjv2
         1I3YnnGzaCsNnjL6MFxB3a9DBst+6UWhGnBhYGXNQmQqW/XozCVoNoUDSSeAc89+QZ2X
         SAJqawrLK+22QaMTFnCLFAgmxgD3n44qeJ2KqOvrrU6H2hZKGxZtuVI6vmQsWDkZqBNc
         M2c20/QzW0ezcmVCzkeRYSAX7Ov2XNBPgBrUORZKXS4G7X/lrPRvcqKSOV6hDDS7Q8m2
         PRhOCGKDatNkbfg0t4Ob9UiXWc5rCByqEV1DFOjjJxfPJ7lCkduY8nl+WyvTS9Fl55CH
         6Lhw==
X-Forwarded-Encrypted: i=1; AKwUvBwCyfHuh+dMoVim0J4v6VYSBrQP84QyCnb0ac3rtLwoP/Lqbx546O9s8zstnKHqFlXhcu4i6ngV/cZ/PA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJUGMDr8n5rklUbDw25i6uLKebM5G3Yr2E6IoAdbtYX+s+VyjyF
	ZYpTYD2/6dSBWvX50EOEb2Q3mt5+gy0f/G5KRR7a2VJHmvBkilicw1owTnQs38SnKgQ9aAmtzcD
	S4vUS+fFfG0B00Tt89llr8zyuHxcTJ3Z0wT5toXp+DFEX7un0Ud/AleN+SrlNHWgLrQ==
X-Gm-Gg: AYBFou1Hf8xWgHcx9ykN90xjaTFIH/h8IPMy6RYY92TW80Dwf9Lo484I2j4TWMTW/Vv
	rz21tO7ifPnSj/Cb6bAnUVklufoIPiGNqvpK0BZQUUo7LugpohxQU/e/ijEQDkkLk3MVV0or0ZQ
	jIGEvYr36nHOahIuIj0j3o8u54zNqSdxa6CreR90SKXoE1LR4U3CLpJZUXCRLGW0tpflHhdKdxM
	AQ3DsbxvMRpQLCUW/yTBFH26VSFNHk2icY3o1SNStvCil/VmqodVXDQOQBlcdUUxxvsX1spINCG
	KZzgNr7osOkBbkPlQ8f+nydXcgjkS62H82/2Wa0BfTRHOPxbJtryjBtF3xul8pYwgzZURv+DQxE
	MQ7lLovEsQEQR28+eVc5WcKJwK+3IDAPkwv3xMrRK9vnPVmmZeKjfISXg
X-Received: by 2002:a05:620a:2609:b0:93e:7dfa:2f3f with SMTP id af79cd13be357-93f29d9614cmr366479085a.62.1792224441308;
        Sat, 17 Oct 2026 01:07:21 -0700 (PDT)
X-Received: by 2002:a05:620a:2609:b0:93e:7dfa:2f3f with SMTP id af79cd13be357-93f29d9614cmr366475185a.62.1792224440743;
        Sat, 17 Oct 2026 01:07:20 -0700 (PDT)
Received: from [192.168.1.16] (46.150.72.42.lvv.nat.volia.net. [46.150.72.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd409989sm10501005f8f.0.2026.10.17.01.07.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 01:07:19 -0700 (PDT)
Message-ID: <a561ff9d-eb2d-4097-ae66-c1857f33e42f@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 10:07:15 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: configure C-PHY in the new
 csiphy_stream_on()
To: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>, david@ixit.cz,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, bod@kernel.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        bryan.odonoghue@linaro.org, linux-media@vger.kernel.org,
        daniel@quora.org, konrad.dybcio@oss.qualcomm.com,
        christopher.obbard@linaro.org, alex.vinarskis@gmail.com
References: <20261017040529.3832120-1-anusha.nandi@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261017040529.3832120-1-anusha.nandi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAzMiBTYWx0ZWRfXx8DU5dPPTzm8
 fm7vfWRGv8Y84tMAdNu1yKbXIAYQl8HUXE5BCR5k4e+cq/s25PR1eSbR+G89wVbnSyUXfwACz3Z
 wnJmQpEQIZDpMScRdWMUvwWK6p/K8GA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAzMiBTYWx0ZWRfX7VMHNGUinVca
 8UXXCzDiQqZ/rF4v2DmHPGfv+RP1YqfhrClZls3VRBpVSe7TooTB5nBebIphBr2HpdTql7tqA+w
 7byXoOJrH+hOqPknPtYJjdQPUFMO1TRVOZ4AJg2+FWxnRx8lPlJIAj3C35P+mkDCPAmCI0GogTf
 MSJhJ5jD9gz4CBbp4wWJupy+KKPRFW6JHM2bOgnT1C6FGC3M7tSwTvOBm9JTLkNRRtAxbs4ai64
 3VidNX76Z4jUyxfkCjpIzeS8cfDuPeP89BqCPsV8GTAaQ9vzJDVozjtoE8g2SWbsviUu1/3hF84
 yzOWxfshDLp4CMRqTo42hLXyGg7Gc7hNwBF3Z7cVTdOnCTJNKD2ijCefHutahICsyBu43jvkBJW
 pZ630z/DJ6zOeDHFQOBc9vyKaQ5Yd075oz48Mgvn5oCeWeYX081YACwj+BpNpqvXzTszLq5LTT8
 ztq0ZHoJb18Ou8zp5Mw==
X-Proofpoint-ORIG-GUID: dYQuYTTmdMWBV_t3QL-_DbnX6wTbBjJE
X-Proofpoint-GUID: dYQuYTTmdMWBV_t3QL-_DbnX6wTbBjJE
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ad32cba cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=/kTH1SCY3H94FTY3n2CK6g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=eJoEciQUwBFPcfgth9AA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170032

On 17/10/2026 06:05, Anusha Arun Nandi wrote:
> The new (non-legacy) csiphy_stream_on() introduced by the PHY API
> devices support only built a MIPI D-PHY configuration and
> unconditionally called phy_set_mode(PHY_MODE_MIPI_DPHY). For a C-PHY
> sensor this makes phy_configure() dispatch to the C-PHY handler with a
> D-PHY opts union, which fails validation.
> 
> Branch on the recorded PHY type: for C-PHY build the opts via
> phy_mipi_cphy_get_default_config_for_hsclk(), populate the per-trio
> lane positions and polarities and select PHY_MODE_MIPI_CPHY; 
> keep the existing D-PHY path otherwise. The shared
> phy_configure()/phy_power_on() tail handles both.

I received multiple patchsets from you. CC list looks really random,
half of the addresses are some internal ones?

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC (and consider --no-git-fallback argument, so you will
not CC people just because they made one commit years ago). It might
happen, that command when run on an older kernel, gives you outdated
entries. Therefore please be sure you base your patches on recent Linux
kernel.

Tools like b4 or scripts/get_maintainer.pl provide you proper list of
people, so fix your workflow. Tools might also fail if you work on some
ancient tree (don't, instead use mainline) or work on fork of kernel
(don't, instead use mainline). Just use b4 and everything should be
fine, although remember about `b4 prep --auto-to-cc` if you added new
patches to the patchset.

Best regards,
Krzysztof
