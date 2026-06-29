Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08E4404BD8
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 12:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782736502; cv=none; b=DAD1TEqw3hpapzj+e28gr7f56upRQNXqJnpxaGpeKLs6gw9/+ihKKr81D9yEV4ktMqJRIzH+3thVkIzyaaf5g+urVJdLMGkcctJglf79UB/WLo3XDxGGWtoZ2/lY5aCCSw+9WVdWVjM7IpIEDsKoXU+dh/RHLqPZHWWuPn40ml8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782736502; c=relaxed/simple;
	bh=9FAS+mDt+OZ2wTFFclBcMONt0IaDUoeHNgfvU+Et0m8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xa6Ca6RGKrr1st3ibG86VX4y6OzOumv4xwz/IF3xaY41nzHGsGL3oq9AQB8f7dpg6lC3dp50T9WMKr3prBY+IgJ1q0zUw/TJhE8VcUSX66sNjlghbLEG2cneVpxsv/8xFmGCndIVANIXCcuA33ReDU2TBJ6JsV6h8DSXcgQA+sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kdOZXKmo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c1URTRvj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kdOZXKmo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c1URTRvj"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT44i2601617
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 12:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9FAS+mDt+OZ
	2wTFFclBcMONt0IaDUoeHNgfvU+Et0m8=; b=kdOZXKmocMPs8ytFWG4Wq7e8ayd
	8TFR7kWYujCwTM2Ta5YBrDl9CxKat9xCGKHU6aLeF4APtRh1lZ23J/c7n8zoS751
	1c362l+X/zpoAtLjgRCjAg7qaVG9dZ+EMpS6ZopqLU28nvyl8ZFHsKmL+JVA+kQo
	5O9D9LFD5a4aepRDi8s9OG1XXBPOsYWEH7qi6rfi4zvEOZwUrLNtVRgv2f+1O1dt
	hT7v9jdPMsesDdTCFjvWdThP/X1yut1X5jA+FhQDpvzg8IbQRIFDZoDa3Fyzi2SO
	7gZ2b6cCxtjmUaUI9nSAygq344jDtNnZrgfC8eskxcuuX3LixQg+St2LMLQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nnw8tfw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 12:35:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5174a236220so28302381cf.3
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 05:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782736500; x=1783341300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9FAS+mDt+OZ2wTFFclBcMONt0IaDUoeHNgfvU+Et0m8=;
        b=c1URTRvjyMgydooofsQKxu0GRiC2zFuFnaj14igWZDiHCdlFCFGeUlbuws8+q/X0k+
         I5Nu7GJXVWaKsrGEqjTIUwSeLjxgJI1msA0MYz8fchiHXO9/XWpko8psNsTthB5g8eEc
         aUlNz8Pptq1MDnqN9F6mujcpmHc1itzvPoBkdWXZuC1F94ekYAuMRl0HvaMkkbBYSEsk
         GOWgonGSn5WgL9jGPSOKcl7GVTkB5PVW5jv1u1SF/1RSp28ux5N5dyowW53ydByZDDxm
         5Sc3ZCZWVQdAl0aHv7AA8ccOWuMASSquX/RPjA322YErUuRuzmYIpRSaXgWfxFiaLxGs
         8/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736500; x=1783341300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9FAS+mDt+OZ2wTFFclBcMONt0IaDUoeHNgfvU+Et0m8=;
        b=XJlHjFeMi+qci7VnxBcdyz+1pIG6ZpK+TdWUabi+IMe6ERRowTBM1CFRdDACTGkjm7
         i+ni73FSYt2GsgV/hytHZpuRrjSU6VKYStXvo0OcpPDYxLttZ/M/xxcyaXUoNpZs5jP7
         MXngcSVyYqO8cv4xNVLEXuzlu2D3OKhEn5alAOkDvJP6YdEe7Iceg4OJYTTQStrhqr05
         ikvPMFSPsr1L1GvaSJbyNvW5+ZfcaTjzhx0Ey53piLofk2+0aRWhLPysECM/Dnng9naK
         FVXuJ5kvnvT842I7kCspKBw+505Cg+o6P85VkYjhJjzoTbMNTvYtDsZHOeuQojNt690i
         Sbxw==
X-Gm-Message-State: AOJu0YzsSO346NBfGGhQQsAiq45DaDFW3ND6kiEgyaja4XxOvooTRnD6
	Hv0yAGsyMLLyjbnXsjnacf+T2DxLWICrP1Y+fCBUB3ln2b/zSSw7KSDJOptwg4f+jI5GDT099hz
	Y8XrOcRyeyNtlA6YUrbhF1sb7xnsuwMAkackkZUOqarZFRbW9uotkUijIFEKr9LgkotNiXtDYHd
	+V
X-Gm-Gg: AfdE7cnPTrCkbEEjP6rDcKe22sFfaydvtvzbrKlzev7ttqM0V0XgOrN6HSghgTvKrOd
	aDlQGxl7s4wSfI1XMWF1umAa3gmomKU1zxRwNh77VMb6hE2+uNP5jl92SUdzq4Nms8hoGgmiYsV
	D4KToKrVHfYv9ti67TVNvNfzipBMDu23st/BG8oh5Sm/oX9LpxoxfRxXtxatFE84hCd6+Q7qmUD
	NGKY2RnurmQNmHiq+KWaLkfnintt9eDSW9c25TVtCvXS9/T14bWSAmrgP0zRu1YsdIrGM9Z6MbJ
	44kRUT9J3hvPxQ4dLrz6AzwN9afGDkwfBdJGrmHx+xvLY5iORafFEdYKvWsuCjXXTXMRMNef+Wa
	8+wEutYr6BFYnR1J7UiAg9tcR3cjZWZdl/Bc=
X-Received: by 2002:a05:620a:6499:b0:915:6a2b:6265 with SMTP id af79cd13be357-92b3e37a536mr1306144285a.44.1782736499964;
        Mon, 29 Jun 2026 05:34:59 -0700 (PDT)
X-Received: by 2002:a05:620a:6499:b0:915:6a2b:6265 with SMTP id af79cd13be357-92b3e37a536mr1306138385a.44.1782736499365;
        Mon, 29 Jun 2026 05:34:59 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbbaa46asm775684066b.10.2026.06.29.05.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:34:58 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: Atanas Filipov <atanas.filipov@oss.qualcomm.com>, mchehab@kernel.org,
        robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, andersson@kernel.org, quic_vgarodia@quicinc.com,
        quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Add Qualcomm JPEG V4L2 encoder for SM8250
Date: Mon, 29 Jun 2026 15:33:59 +0300
Message-Id: <20260629123359.3469724-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260625133828.3221781-1-atanas.filipov@oss.qualcomm.com>
References: <20260625133828.3221781-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwMyBTYWx0ZWRfX/unYITe5QUbE
 qbAnF35w52eJLo/YG7Jp5g8rhjF/NmByBv8XvqKJtrSDryjDcql5GQFP89E/VG+ncMls4oZTjXK
 cBg5hwC6zMV0lTHLDG6eYzyOmw2TzDs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwMyBTYWx0ZWRfX3fiE5XVgkm0e
 uPqJcND7LuVHoN/jsAHoDwAtDM2F5esZlxH7eioazZ8CNvxcmynDKKTziGEJuXxo3gTiPIP6J/T
 CRCMm4giYMIhXVgcWPWmzePcfXMaNo76Shj3JxM33XG4kakhTo5pjOLVO/IQmViIZUdZ5kcwY3h
 sP8kajgmUVvQJZIN15l9kB134N4njzuKtw1KR6/efdFjc66oxEnRVWPumcZw4C9h6fb7C7pGez2
 Bg7lpBHzjUuR9gJW2jpPqq/1ESu1ZU3fxPVxdm4latCkTrch/6vQHlGMHBIogQ5M31xqX0HEPtq
 uSspYBmkcIFgbevgdc2mqNHE1YbjBfOir7ItjImlT7Xq1IlEExVXf2IWWcvlHl624q7A0c3o3IF
 h8VGucEcIDP8ssEcmYPqIjuJLn/h85h2MV/JfGp2Z4/QC+NlRH98EadqRZQKo1BT7azKO0tmeix
 oqwRWAorZXC5cbzHvPA==
X-Proofpoint-GUID: X3U4dYBHvWaBamYlA1-2BTCNEbftxE7Y
X-Authority-Analysis: v=2.4 cv=cefiaHDM c=1 sm=1 tr=0 ts=6a426674 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=IiUnP6lGiGDxgbWSFccA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: X3U4dYBHvWaBamYlA1-2BTCNEbftxE7Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290103

v3 posted:

[PATCH v3 0/4] Add Qualcomm JPEG V4L2 encoder for SM8250
https://lore.kernel.org/linux-media/20260629121110.3469048-1-atanas.filipov@oss.qualcomm.com/

Thanks,
Atanas
