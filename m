Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831515;
	b=Gc5PDK2nhtf14UKrsVfUR8v9Dwk2el/gNaNwvPlwPe6U57YGVvVo4/x8r4C/21G5KgIO
	 w90OOLQQzbLtIqsOoIv7QGvPsu5ELiMMa92ocQflHt38mTuEpGTomumL0azRqT20hwja8
	 K4Fael/4hPvVWfjqxBKWbifkC9bllDZ0k4wNBfGVcaBN8JHOQ4rp3oN1BMBXNRhBupre6
	 cIuETCA4g2d8duTUtd/CsPyHqJhdTXnNJD4RUIwLQOr9YsqzVEsFdXelEgO4Vugybm80b
	 YGYVC9ueejec0Dm9oHAgytoGjSTfwFQfp3LycZyM2jfnlpCsmYs/jhlPLW8SLpBe2qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831515;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=S4Fp7tclci1zEOeCx9GxRlSEUAEzcSmzgk0IZO9SGps=;
	b=s8htkxl1QloXHPeREHfjvLkErTxr8D3L0GcUMYnm7KqATGN4go9yhfyYm41OYvaMMD+V
	 BvmOgvvk1gF4S+jvEBL/Yqtu1dMOEU5tnGzWCp/OCk4c3QPzvAwwHE8w3k+e1XLfuqqZd
	 ecEGuyqp0F12mXogVcXSHOzWJnvkUpWXjGK3rGP2o6qDDMeLD3yXjoUZj8ls2O/5Xy6gQ
	 luietvfJSikaM/PHIXpmFtHgvlKHoYdb1UDkcs/IBzMhUGRKzYi8kBQ4fAEqelFhx4wbU
	 uVZ0JGVGgQunBhrOBsRZxOl2tEWoaZ6rNpOjayuoHx6g2aAV3Jwi/aGe3BA/TBicX5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d1YGkDnE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gY1g7Dmz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67314606A323
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 12:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67314606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d1YGkDnE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gY1g7Dmz
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC16oB3770812
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 12:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S4Fp7tclci1zEOeCx9GxRlSEUAEzcSmzgk0IZO9SGps=; b=d1YGkDnE2B1uZO6w
	EfxsjoYCvgCpxAiSilzt1FrP1sxMxee9mD5Ol3p/idGp4kiwr9VRukK2L/212BVq
	rEE+CvtXqzkRC7gWezH6YRTQl9LpBWs5ugXCOSSMxIKGd3T9UkkGQ+EQuITFChQK
	w86O5wQlmq5jjlCACS1Oz5TiwUTE0HQQn3KZe2fsnLx20bFPAhgWnHfdZsCeU0U4
	9/P5Yt1D4+k4X6NjNtRoAS/tXbehhQjbpQ011jgwYHz4XDTzYwgc+8fiZyT896yE
	Csaw+LBfxwClsI8yeBz08ON25eBpWefHH357eu3ywc+yMqinmOW/y3XPfdBU0ji2
	S+kuxw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyy6ggkmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 12:18:33 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cde00369ef5so510360a12.3
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 04:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794831512; x=1795436312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S4Fp7tclci1zEOeCx9GxRlSEUAEzcSmzgk0IZO9SGps=;
        b=gY1g7Dmz5fKSyoy7NTCR+hLfEyCJ+wzFervI2HnNSk0NFkPtqkzYt1RJxfwy0pyzYb
         jvkh7mbeZMSd8udsgLby4dA8U0UVQBYvSMneDudq35DzLCcJqt1xCPpc+1WgxvBlNoSF
         HaBrIuY0yIYABIRzDWLjVZqjhDnsuaC2Ct+kbC2Oxb5gYz1g21UNR8dUeC3/huGe0azF
         4n9/3v+ATcKWcVy7LHhLw+NbVJXcD56XPxvxiVKWAt2fBIxLYDRLJyqTGzJmqIcfbp2B
         OrKwDiuGgLi1FH0czB3nqJsIU0fi1/cXtzve1ZbbU8zvp5ipvtonKYqrj+0e1BR4lLI6
         RJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794831512; x=1795436312;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S4Fp7tclci1zEOeCx9GxRlSEUAEzcSmzgk0IZO9SGps=;
        b=DtEQjtr151VBJSOqnG9waO1K7tZGUch/YkpQesQZjZlvLeQGiEbQ76IBjXtzREIpAZ
         nwtBsl7YSpEaseSj83fPDiUXkb9oSIHab7Elp4F7WkiTAtuB4+ScoJ6tRQuJdLq4RNfC
         CJHrPeoOwzJ43Yctt14Xwr2ggIfFpQPtbq5qGD8ozTst88X7wEr2mKPAMwzvia6L/ugb
         r9bS7iTKVFRc0sjlMyfiZB7O6E9ZKXnJxf0k+itL2SmPxi1o9TcZfTxVZfZBYDg0T2tF
         hPof8LuF2+1toIhHHQiRF8yk7v5ZDGJ3XyhTwpSz316Dh7fcXMT8JfPOF+lSdcZbXT+t
         Ynag==
X-Forwarded-Encrypted: i=1; AL+hErEe5iPJBgGzS+qA1aT3TFUQZCPIF/h90/pVYYMY/hWOB+/1qW0WDASxD2roSZowrTYlhIi6UxBjB6oSdA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9+Qn7/ITgGqTCyW7Ruh/oV/+uLCzKqqCmZCd40yiYTwMmfWN/h
	WgJgGlp2Hy8Q6Wg0OBxQa+98ksm9rJbPyQAXIuSytfV6Ex/k6pKmyQ1Nbkzf2CiQ9fUXm8OWybE
	USQqOZ5qBIdOnBORRSXIk056yAn4830PNkoAQhSoaKsHNOm1Nly1xzapBTWC19YJzjA==
X-Gm-Gg: AYBFou3LARqawHJlJ3UNktn/PQmXt3T5n5HTJkFoGRK7jO7UcmG6HXrqq6hmIHu9Vqs
	Qh+brbkodjuxArtJ4NM3qoj5DOsysv8Q2jrliEjeqdfsD/f3YiliW0xLBxPjYoPDlWL955oSZ7S
	lVxjtG/V6Grhp88LBAUB9Baw24JEpUUqz/8mH96CWsGotnF5HM7lRFv9yHkOJdLeLo3MEYkI153
	AgFF195DlM+KuiBxgxPCPfXavpK5oSSgeKEngZQU1d6DjWCBIkCtNniK7njSt2QxTpUkGPvKQGh
	uIL5HBPSmwVpwXDknOYelZvYKJzsZyjBWTyaRs8nkem91bH/p5mU4O0eE76RxPwcDyGLCik6wPm
	mnMQCBXGcaYQYjZEwPSudOOwoTUSohv8pKMrUG7Ui5ECF8opN+nBThFnSgyNabVMH+B1vRz3VW8
	s5XQ==
X-Received: by 2002:a05:6a20:9187:b0:3f2:e26d:a96b with SMTP id adf61e73a8af0-3f7a4eb9173mr10268496637.6.1794831512209;
        Mon, 16 Nov 2026 04:18:32 -0800 (PST)
X-Received: by 2002:a05:6a20:9187:b0:3f2:e26d:a96b with SMTP id adf61e73a8af0-3f7a4eb9173mr10268463637.6.1794831511749;
        Mon, 16 Nov 2026 04:18:31 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc1898afbsm4145008a12.19.2026.11.16.04.18.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 04:18:30 -0800 (PST)
Message-ID: <de0bd55f-9b80-414f-adb6-eece067d92ff@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 17:48:24 +0530
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
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: media: qcom,glymur-camss: Drop port@3
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com>
 <20261113-glymur_camss-v2-1-b1b76509c744@oss.qualcomm.com>
 <20261116-vegan-amphibian-muskox-3c8a55@quoll>
Content-Language: en-US
In-Reply-To: <20261116-vegan-amphibian-muskox-3c8a55@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0OCBTYWx0ZWRfX1Q2wezPu1Gtb
 yRCylCQbE9G7WkA3k8Uh5ff2y8kM0dnmdy/cVvxkZ/QbSBKbLQhP+sntZ2JyzMAbgFQTfoJB5cs
 4BNDgJwrjXKB8RX4nDSWXeaCoJukZn4n+hBMXU5TTX9jXJlZRpKs/Wg+Ra02un3hU8EH2s3WBSf
 ZTEBg/Yek8YkgqqoYKuGuy36cY0nxbcmgoFFhKk1pc1b7r/YxT87VL65gyLz1ECOrtrffyZzXSD
 rMVIAjqUs2brQy7w2RAYbJD9rPZ5a483pRxlPn7hoCsF0tlfc8ax0v+QyXaNbD0xfFCFD+08vAh
 +sDn1GGRH1WFe3JWYe1yOAbWef4sujVAEu4m6jna3Y36xQcB0ixlvAPOEDU1XexiBM6VSxfyl7z
 ud8xDyfTNuFgrPaVM2yyWq5/L61EYAerSmVw5EyEEC5OT+7PfXDOcP8LjFI7iOoGqs9JN78rR6H
 W4egfuETPrvj1lITHZw==
X-Proofpoint-GUID: qvWHge_r_Hgdu5GWm80T5DOozEmY3D3t
X-Proofpoint-ORIG-GUID: qvWHge_r_Hgdu5GWm80T5DOozEmY3D3t
X-Authority-Analysis: v=2.4 cv=D/DSufRj c=1 sm=1 tr=0 ts=6afaf499 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=LbPuwnihYiX5_xJIcoMA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0OCBTYWx0ZWRfX1POlina5Jx1V
 Qkm9XQYP18ogufdeL8eZ6pKVWzneVjXqU+Iakv3IaiwSAT1TovMhSIPhznBC+TPZA8hjpNCKXFg
 gluGaBXbE0eWP91pqUs2BhGb0/WlQJ4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160048



On 16-11-2026 17:39, Krzysztof Kozlowski wrote:
>> Glymur has only three CSI2 PHYs, so there is no port@3 in the CAMSS
>> binding.
> ... so this was never working? Or was working but you change something?

It was not used in-tree yet. The existing example was wrong; this patch
fixes it before adding the Glymur DTS.

Glymur has three CSI2 PHY connections, so the logical CAMSS input ports
are 0, 1 and 2.

-- 
Regards,
Nihal Kumar Gupta

