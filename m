Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319774B44C5
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 15:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658973; cv=none; b=DLUf51Iu8avc3blqgTHHQ+xDRVrWqlv53sfUw6s+AJKThK/O9dOHFT+uaUHw1YLcIbAkwUYlRgoopwI4bi9ZQvX47rHb9FemkYrPVV6UQ5GTvL9HwXMnVM7uWD6C0xl3lYB+mH9loelBiLUP8DRx+BaV+x2SUsZ2a5V+9/FX814=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658973; c=relaxed/simple;
	bh=TlMRqQ6L0+W+LjZ003OtT0C1xwK4kdjOBRFHg4mzq5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MVv6ESZAarkTop4QSWd8zyCXtLaF/iqXVjFRsOq7o3RyDwRNYGkbKk3700qQcoGthYV+povGU36aUTu1eIPP0OUxcfQ3MS9jevmJialYkE0tHqVykQWONI4RCS8LIU2ADSSza4WjUWMMc5I8M2Itx3AhF7LguxqLT14RKaPI6m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=okrG+hUE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gPY2Gki1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="okrG+hUE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gPY2Gki1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDjxDB1954822
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 15:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Hk36GFpcKUAtTar/b083caQq
	YINIKpMqKrsbZbYUlBk=; b=okrG+hUEVUELGSxU2Q7Gy0F0NIDgLQdkasDpPTPv
	/5PrsfZv/no8tWk5cA81d56Ckf4IbRnjg+JBwaoOh3O+F6y/mqo5KfTIy/kNx/WN
	nUPfkg/cYuaZCQdbwrEdX/6Rc9/stSWbyrGgRC1ISGIvVgYmNlMLdWLUrkSYDZ3j
	eucRk4qbpco0a4yP9IYtDVMfcV9RpS35k8kDsTsnjdcdUGQHp9LU0Zn0KQifjvbj
	gS1zx9+IKGpbZY4H07Q3qdKaO/nsYdQz7pOIw04TZSv/Y4MM1jBgrXet/aBs14wC
	rgKjZL7TLostWY87EuGbPRj8/AV/9oIlshc3blyAkcE9Vw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grgu5gqm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 15:29:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93918756165so178200085a.0
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 08:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658959; x=1790263759; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hk36GFpcKUAtTar/b083caQqYINIKpMqKrsbZbYUlBk=;
        b=gPY2Gki1IqwIN7lJcbyQFuHOHZDMJDzjXH0gao01KFLnoxzcdn+uItHbkEB1AzpjLE
         HH64NQKX5fi5kWRA7Ao/QqDKl53OhrWKodN/Z2azWtuXiJWhF2jyihXjSw/XJoVGdTFG
         nq3RVptG9CLlYIN1iVXxWIuo0SJBG+nDzIv1bm00pBFvIkw51UfX5lHAC2UYrWLGR0YO
         uxemFZntJqk1a2lAlxOC4cvnoLgbyBqCjbPjH+bKixf27spj0pgJzubEww7wfPjGIoW4
         ZteSBxbYwo5q1kmKGrNxXxteyuRimbL+utu80Upi0n9/I51PgB86NY29TNFKWv6oWGBN
         QTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658959; x=1790263759;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hk36GFpcKUAtTar/b083caQqYINIKpMqKrsbZbYUlBk=;
        b=x5KTT5KdnaEcOf/xaqEEp7EyY9HscyDMFQ8C+3xeLjMmQkYONTs//MjRR1UwIf1OxS
         ofyix6FQikee4XhHciHVnw5BdPb/cU0KpsKZ1svSE8FfJrXsBBkKU5EF6R4dTC9+MEd1
         MWqR36YqTcugf7FEk2aS7q5/Og2/gCYmo/tIaibD2yiDw9wlAalAHaWgyVI1qTLOpsJD
         cG53IxSpSh2G0PD9ybSwam95BuMUQ0WguznCCSyMcfl33vhYlFxrfYTa4J7fQZha6CmM
         X+oacr+z2bmtnAaq98ACRwHTI/Xg+F4ROiRHBgLmJgdQ3jd5lKhEJJiWVzcm6LFnac4u
         uZ9A==
X-Forwarded-Encrypted: i=1; AKwUvByD1st6r7puXuV6yK9USWuOi9+ovWqJ0cQhgS0AHFykNBRKsHSiz6p00kmxT9n9Nbs+688LETgzMpnIuA==@vger.kernel.org
X-Gm-Message-State: AFuF++k2YpuaXzAzj2N7A3gGcMJpgBCqL3P2ffhBE8/RHEGDj6E/uFVw
	76QnvCrqmlVO8DvW6edmI5h44/eMBl8kBrM/Z9PklORlDnJOOd4lKVL/5+D3QQi0PhbAVAcHZ8H
	TOuYRcYJ1jeD7BwALNu4Es8Xe4ZpJ4c+z/ZQ8UuHN2K/eUB7R8BWLiwFwvBbxx5s17w==
X-Gm-Gg: AYBFou0P2IU1t1MlYptwjpRy7WYy/QFMIZa/eb2g5b09Aew7wEK5SJ6Nn6bQ8zTXp6i
	gQFXXqQkM6qwyKbL2/56Ihq/LyhkQC67g43usUvPqoFxjxiKypLnnMUwClRdvoxSiC3TeAXxAH8
	E5f2/YtYNIMWroRjY7NxOfsmX5IEvS6MLCM9W8X8j2P7jhMcONgcI6Yo3+hZnX/OVOQi74/Ikih
	Q9IU94zWQqIiysrUuNoM82t8g2gWqa5Vol+BqRONLDDWcGgQs4709k6UVj1jtb6b/+NxB7+L/XF
	GHyHC/gv+mS2XK+aYOWZNeJ1glimte0PqBWxOUrH0qYZEuZgMgNeDMgBKppoP9VhzmNk8z/vrmy
	8UfpWL3v0/G5+4Q==
X-Received: by 2002:a05:620a:4592:b0:939:31b5:4e08 with SMTP id af79cd13be357-93bb7267e92mr1277598685a.0.1789658958626;
        Thu, 17 Sep 2026 08:29:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4592:b0:939:31b5:4e08 with SMTP id af79cd13be357-93bb7267e92mr1277595185a.0.1789658958112;
        Thu, 17 Sep 2026 08:29:18 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbefe1791sm68837795e9.1.2026.09.17.08.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:29:17 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:29:14 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Subject: Re: [PATCH v8 4/5] arm64: dts: qcom:
 shikra-cqm-cqs-evk-imx577-camera: Add DT overlay for Shikra
Message-ID: <z4usj632ovj2cadfgp2zvwue6vuvqhifzgjb2uvfikitxksdvk@4k7xnyojsa7e>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-4-9b9596221cfa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-shikra-camss-review-v8-4-9b9596221cfa@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIyMCBTYWx0ZWRfX82D3g0uPvhQD
 s5etHdCpuAy/AbKu/yf5fUAAM3ojY2YY6WjnGjrxqxfyZyvMzfaSkgddTQC53kZipHEeTwGuXE9
 nL8YTgEqeRZlfQRNSWyyOzpvt3vmgFo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIyMCBTYWx0ZWRfX6F63BLiXcY+O
 BDBTnxWNl53TK2205wPznf9kCu07eGCIGub5AWwYP0roTVPFjJJFsWlzz4aQG0UPWuxnw3eZ0BR
 O5QVEiaXiNxA4+xKTPKQF2uHEI5RbJiQIMu7jARByOetk0vw6lbONKvDwVnRuk6BbxCj+Q3rAQD
 mo1QLO5mJmgi2WOse3t5bxCvl/UfhEJVmwvVfQbfddKJBHP8jI8+JxexExLRaVLhVe4lUHyMaw8
 lwsVyS6jbmbe3yITQQZZ0bdQfbZEfOJaNyjgO+sVCjcfvlwdFvIc0F0ll9GhawISp0aHWNuptgt
 yPsTcl+pDNn5F87LNpw4Jz3YkQP4U/NrKZgKODcb8yLjX38NJ5iRE5lZ7Goayo343kGyvNL5n9h
 zcbrsKS1zVbnUYMhRj+ll0b2PV5gPM0UFanEkSSGFJHgfMviBYBZtIV5V6Hzfgy8bRDT0hbJpV2
 vEKh7bsRx+bik479pOw==
X-Proofpoint-GUID: 6YLYe62lDh72Pd_dS02QGUioA9k0eOmo
X-Authority-Analysis: v=2.4 cv=GvbXaU1C c=1 sm=1 tr=0 ts=6aac074f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=XE-wypd_VeY0GsksmEIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 6YLYe62lDh72Pd_dS02QGUioA9k0eOmo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170220

On 26-09-17 17:11:03, Nihal Kumar Gupta wrote:
> Shikra CQM and CQS are retail variants sharing the same PM4125 PMIC
> and identical camera supply rails. The only difference between them
> is the integrated modem on CQM, which does not affect camera hardware.
> 
> Add a shared overlay for optional IMX577 integration via CSIPHY1,
> used by both CQM and CQS EVK boards.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
