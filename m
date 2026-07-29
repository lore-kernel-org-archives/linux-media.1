Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2402798EA
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 02:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785292353; cv=none; b=AMfed8smfP/JBx1ipGAy0uRbIiodgY+PEvb2fVa068lv7TcU5hkhNPx00jno709OBnlDG/fZeI0r/FACNQad22fWs0IDTE+eV3uUx7jaSQkgUO+4c49Eq7UqQhqpkTZdcolC6Irgcw5vgveDDEZOMAkuSx8BCjK6jGrPBFkyi44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785292353; c=relaxed/simple;
	bh=6yzLMpZIdPJWK9Tx5TNTEsubG24wwLW8yQMrvnKjikE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DNkb5w1LlW4CHhcIuOLcoppRKZOUgp2TcKP95027eU1jX2XKAGKf106VXBzLAHGbb+779I3u1mugtm5dlq05OqFzwqfcPn5v6KdAopNyl8MJ4twTWJX1+q5n05vsTPz6lSzWspbneG2JqIb7UDGM9DM78RMPx0Nu36r9dW+nJY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JgFdpFue; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GNc9+WSC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JgFdpFue";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GNc9+WSC"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T1Ho6R527969
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 02:32:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UkFCA+A9zEAEhURVVraQS1e5t+wojCwkA/1MyuAxxkU=; b=JgFdpFuef5pjQihp
	eAhkxEPzRL30rBcIgBcLrsHs+eW99x3UaF4DrtUQbJjf2KkPx58ldhouLpZDOHNY
	zYjGQCoxwpjXP5Q7k7a3LJHs1WmwTH2GY7ZUk9pXNCEbTKp7ljpTlqcYCOcl0WkT
	sjW2tmojZEtI6jzUuOhCWh+UWCmHHUv7aib1AGyTxeHzHJLyxOhUQlhSDU/XPCUq
	zOih5Gfck07ds9MpHgaJpcpwk0llBdXuG/vjR/79NG9YzwElJsvC25fFC42/Zuz+
	+TCkQIPHM7YXZPN0ul+TWU4gAj3i3vPOSyLAG3uxhIHfYjEDc+G3EHP1rBP847DJ
	PgNsdw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq0q09rm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 02:32:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so106256685a.2
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 19:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785292350; x=1785897150; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UkFCA+A9zEAEhURVVraQS1e5t+wojCwkA/1MyuAxxkU=;
        b=GNc9+WSCco5z/DsZc5DcB4AvFeE3N4GySU1rhq5oPNSvdW7/1tvM4pOdFS3dHmYhe1
         CT0PkfTb2sgOdRSX099ShKC+iVKAYB4LBnFeyn394J3aO+LOKaMrakhNXBG8DwVUFn4F
         CwEXjqiJQIG02/+Ba1gNA65Dl51USAIaPk8x7MckrAEl4MzhEd9HGRuuzMweYH/HyCwT
         lRt8+pQNUfUOIGwW0uJ9Ld2IjB4R5s7KjHUVL6Ih3r+K4s6pOhRXwP5GeZZ9EKEyhj35
         MtISApgNWadofrO8f1YJ0pxJxTk416ZH5P+FjSYxFr3ZWbdzv+m5N/FzWTJix6erGMQF
         j7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785292350; x=1785897150;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UkFCA+A9zEAEhURVVraQS1e5t+wojCwkA/1MyuAxxkU=;
        b=mmNZIfvQkMALNQwfg1xNcSRbh1ld47Cnj7T2jWf54Wk3qPOd+g36B9MRFdCP3AAlkw
         yzPDfH+w2lMPIjlbJrdZcAzb4w0zKG3/9BcF7WYlan4gtycucF5RF8k+GLEU4efObG6t
         m08sgeyz6poGqmwdnVAQLMe3MXpRFEJbmdhVBTg41aMW0b2oLsyh38p2DwWQai+37dQ5
         mE7R+0rykrM2LMF5O9iOPeyaedm54NdNV1Uke0ALs3QhKuXylI7apXbo2pshxwYL5vH7
         vEGG9u988Q9QNleMw6bpwTG2X79rycRomxOOEtrOQEuCxGCJ81ggNCdl/AWFZ8iYybyU
         dZ+Q==
X-Forwarded-Encrypted: i=1; AHgh+RriY8NBy4yFc1LqNWgk/WAS+7SkYl3ja9OdducDO3pS+uTGoDAO7YDq4hoonQm6EdNLTNlJpMeDkFzIaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVEd2pq6+pIi4jQbnRAn+RLl6liLAWWS3BB2Q9jaI3VtKqFaXW
	KsH/kxGE1aVgWegy8Y3LYDyXQJRxPH9vVQWxlNUOL2Qb7pHb/KbJ975fNvDIaiW81hGpTS4+iJX
	Xt5g0Mp0W3D3+enfjXtSMm3iDQvKsMqcbPbhr4P1/HZhZ2Ot5QJAct40qm1CLgx2mUg==
X-Gm-Gg: AR+sD13ub1bjAa4czd+In2j1iJ2C8deX6/jgwjpxHZ0xqKbnu2fgrD9bL1kgaNn5hL/
	+tP8Gsb9/XspaabGHdnrcoi4SvoRZHDGdTmQLxNj7Woil5rQPi9MdYEfnd4cHQNW5hqldEIUVb0
	yPRqhW9/LjP0lDo+hKT7d6X6Qu78TE4igjX0CBnyYLi1nva3bGqmwdgo8nXbXjXVsymDSzD+sao
	X+PVOIhaiszsLeUqG74+HDWuV/AYjL9lCIHsBoKMr1AHKoY9cYTk51a2xjJvzg4IovbOw+croQS
	KWm5GISQoCxf0/qiEZUWd7xqhxdPIVCNlcofeNMUKbdNHAgSH6CykD4BgNDL5HmThUIKZGb3Bh5
	50Vnrduuu3iKO9jf6+XVr8NNIRmyOg6DJTLDv7TW86yvefIZddRfkfIG2wRqHWEM=
X-Received: by 2002:a05:620a:6405:b0:931:3025:e735 with SMTP id af79cd13be357-9330272c4edmr551508785a.82.1785292350476;
        Tue, 28 Jul 2026 19:32:30 -0700 (PDT)
X-Received: by 2002:a05:620a:6405:b0:931:3025:e735 with SMTP id af79cd13be357-9330272c4edmr551507285a.82.1785292350031;
        Tue, 28 Jul 2026 19:32:30 -0700 (PDT)
Received: from [10.38.241.225] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-933e73181e1sm70530585a.25.2026.07.28.19.32.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 19:32:29 -0700 (PDT)
Message-ID: <82b91fb8-e220-49fc-b99f-81daa819e3b1@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 10:32:24 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] media: i2c: Add OmniVision OG0VA1B camera sensor
 driver - IPU and ACPI
To: Alain Cousinie <alain.cousinie@laposte.net>
Cc: conor+dt@kernel.org, conor.dooley@microchip.com,
        devicetree@vger.kernel.org, krzk+dt@kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, robh@kernel.org, sakari.ailus@linux.intel.com,
        vladimir.zapolskiy@linaro.org
References: <f12c1344-67ff-4242-9c39-59ac208e9b35@oss.qualcomm.com>
 <cc697c8d-8389-4d26-ac3e-4dc51a247dba@laposte.net>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <cc697c8d-8389-4d26-ac3e-4dc51a247dba@laposte.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a69663f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=86shel-bPae3R_vHdxkA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: TcTq93VqRVKCsGlJY4CMn8-IS8TVRj13
X-Proofpoint-ORIG-GUID: TcTq93VqRVKCsGlJY4CMn8-IS8TVRj13
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAxOCBTYWx0ZWRfXwDPaSLbZk44B
 s/uuLyvY2LRu2n+Qr9BX/WmObg2a5qwzMRl7vHPy4mHyjOnE1/5KMgmv++RnGVlq9fXn1Gk6YHl
 FP5s27QrkezZelnpWs4qXUXVyAipKYRyZN0lETjzM4BfTCq7xoqALKUZ1aB1Y11HGi7TQkJRbm0
 rS0XCJBTYLT3CoyjfF6QaKPoCir6Ry44PjOj0So410HeV+jSE1c7gZvQtHF86NN3+JcqOS6z1Yr
 OgJtJtD4ckBs8Xnai7g2/CmcQ85fgc+qvItjc+Y39VIsEEXhdH8Dei4bZWSOus67uUNLEkVGbmr
 o8riAmWQ+OJup5opqzsYGHqkPm9vctIihrRynyZWR2sKW3ElKj78yZtL5yJkP4TSwSA44H7Uy4q
 wBvdATqR1xqypHaOfmfexbrPlztUjTOya8saZjYdeniS6Vs/fr1vvJoyt5jEKJLUsYhWtUh9ICN
 9PrkojdaDOMaT5576fQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAxOCBTYWx0ZWRfX5DcHHUl7RbUK
 txw4z67kGK9yh5BqxrqU2FKp+0k7H1Iu+fZMKTs/ZZj5LYvvGpIoQU1heeqYtZ/oX12P/fgp6tq
 v6g3XvOV4TbBNXB75UzdJp58nZ3SeOQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_01,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290018


Hi Alain,

On 7/28/2026 4:27 PM, Alain Cousinie wrote:
> Hello,
> I am a novice when it comes to the Linux kernel.
> The og0va1b sensor is also used in laptops (HP, Dell, etc.) with IPU6 
> and ACPI.
> I tried this on my HP Spectre 14-eu0xxx laptop, and it seems to work 
> (though it isn't fully functional yet, as other elements are missing).
> I would like to propose adding this configuration for this sensor.


You can submit your patches on top of my patch series, treating my 
patches as prerequisites/dependencies.


Thanks,
Wenmeng
