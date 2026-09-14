Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFED4446EE
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 11:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385232; cv=none; b=i7zZdtwDstSaxQyJPr3+blr2yobkLAMc1xgoSG9IUhenhiCaa7QpOLll5fHFTZVHNUDx7wXfegtbc2l9n0N1UQK4Sd11ElmAK3FwuVQVmmfye9yaHVfKaoY6gReK1DCN6z0z5YfadTfNHbT5F93fDLfyEy122hgxHoFzzWVLDYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385232; c=relaxed/simple;
	bh=S3cHWu7xcUvy0eCh33hOcgT4RaUxYY6azMPOstL4lBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k6ioioMgL/5LwIbBPnHQFMH6YQ+YmzXvV41Wurgte2wbacDwig7JI8MF9AnZ1tahaLIXIQf2e0Z+RhIMOZmVKE+4YofPY3dOITWqs9F2IzX93okCh+JvRVkuUKziyUtojtxFOuHIXNgmRCH9JXddulvaMlLCbPKoO3bT4by68GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GosI7bja; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XkNG6nSn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GosI7bja";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XkNG6nSn"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm1W8727598
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 11:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IJCHzSLhrd043XzsASUdlLLU
	ScQGc2AdK8sGqJtE+JM=; b=GosI7bjaYzMwzcEP8402h62t9XHfpySomYVO4Bqk
	fSybZG9pT8UqZyqVN5Me7TOq6m7Tj1XDBr0IwPwwxOQBrQSpygh7HhiomPQxsJ25
	63bazsxsFuhHZhd0wYAN7K3bZBRcbQJNzRS0/STG7Jj/jh3qoBEtyIzGP6SeNiT7
	lvFKvoUD+OUG7sQxVtMIW4FwO9Xeeibk7YXDf3F8tv3MmXavGokYQCUKvPK+qfBn
	ks8b6L071OKQJOKth2ahP5De8DtjA1LnWice1oB+PZx1dAwZGqUwUzx3e2/TkZ+5
	9/4eZv/TsdFWd/ka/EbDENFxef8EeGLiAi1isL2Uw0Ma5w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5rpch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 11:27:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936e393061dso507894885a.2
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 04:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789385230; x=1789990030; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IJCHzSLhrd043XzsASUdlLLUScQGc2AdK8sGqJtE+JM=;
        b=XkNG6nSnbIyG0mrmEUJgkhyYesi8N1V+DAFl8UwY7LBi5WWB8jowMfS1JXW43R3P5K
         5Al0xvCGFl5jIn4KNMV6qJkC/ME3fgf3n08GOacAwBox5VWk4/pQqag+XoWYzUvp/MJf
         t9ZpkMkwhNjcXVNi7R0EALX/o7FIun/6eaAqR5q/Fn7m57XB90yOKF84WhDW76wSfJ2c
         YgvyxpsIjlphj28Px7s5+g1oxMlKifL5x9MTI0UIpMjSpSbOP5NlkuW0zgWmSmoRlJhj
         wKJLMwAXCNfcFJjJLp5/dY2dXcYQW99h9FsgFfMlKleCOOTuXPPGBzCm4sfwf9O38BZ/
         RLiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789385230; x=1789990030;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJCHzSLhrd043XzsASUdlLLUScQGc2AdK8sGqJtE+JM=;
        b=hfMgpCnCFFc3+qFrMliWEZsnwWG0TnzKWdA3uWg6kpajsxvin6QxIoWAJ+cTMy9A2/
         n7IvRyvN34+OQ/0KYl7M/6Lw39HHPHPyeEByGSnFT1jXzRo+MLhmALmO7ScRG6Lbr3qD
         o7hBUujpfkhjyNOGryfFEmGdLlwixiNJ7vY+nMZwQwO3TD6ZF+a2Kmkm8sQ04RpQO9df
         l4chXAMqZQA8Su4Z+rpgoFTXiSPgoF9b5L7ff16Rm7royF0PQligA7GVi0uncnMfHg5y
         qaqE2dbtHec/NIDncpnnuRj9pWxX3j+VXRrJEcdZ6y4P8z6oh0LiXfb/Qr9uBiDjBPvO
         Xciw==
X-Forwarded-Encrypted: i=1; AKwUvBwji4UWza1XbnQBM4+y8wWXrD0d2zYXsTiEfME066U9S6w8+PoP3E8L0l7NHbdLfgmL6+TTxJyedcCjJQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mne+FeNrq+NduJO1UyRm4xBxG+UyXK4hWHBOgNVNnSM42y/M5h
	2h4GytAexuEqgaFgW0tMOlDDrEcg6lAlL1Bx1YSx0nXnZMv/mwqjyuUatye7lUqw4uxB37R0Raa
	dKm/PWW2Zf6UUGmMAo76VvpcZnSgBrcsPkyswMaEJY0fjP1KGzD8bqrNcVVSlBXMgXA==
X-Gm-Gg: AYBFou2Va/O1WM9kQH0GRiUFxMC8pwURN3UUCGWUVknzryN/QloP9aaTwLFZGSZZCQy
	jb1JBF/khnW/kD6kzDa91YsIe4OL1s/NqrSjUk6nAvdqIJscoaTS7MhSEQkr23uDOEmle9faDhl
	vInb6bsuAugRLXMNyvnbURjBAUjQJeah/uKXqX8brpVcC8DMHzAmJGAmThIrt+Js9VOWC3O22pk
	eQ8jIwCo92FC9Yb0rOP/2xfPFIuHMQ5SS0qZVCyBvI4wKkc1k+lRtwLPIT2ivaWA/249syJ5Zi6
	duaKLDJK5oOxEzlYHgW5Gx7DwkC6PH2JO9ihaHu+3jIgNT3R7uAoRqQwlI4M5aZ+cLAC+ImVBjl
	58Bfht+WrSVnFVA==
X-Received: by 2002:a05:620a:1d0c:b0:93a:21e5:a8e5 with SMTP id af79cd13be357-93a2986f870mr277726785a.21.1789385229627;
        Mon, 14 Sep 2026 04:27:09 -0700 (PDT)
X-Received: by 2002:a05:620a:1d0c:b0:93a:21e5:a8e5 with SMTP id af79cd13be357-93a2986f870mr277720385a.21.1789385228954;
        Mon, 14 Sep 2026 04:27:08 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e7f5sm26107741f8f.9.2026.09.14.04.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 04:27:08 -0700 (PDT)
Date: Mon, 14 Sep 2026 14:27:05 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: eliza-mtp: Enable iris video codec
Message-ID: <ccceh4gy3otlfegvbd2macgc2kend63gorsak2eukap4jm4vbu@q5pcxpw4od2s>
References: <20260914-add_iris_for_eliza-v1-0-e8ccd9b8cf7a@oss.qualcomm.com>
 <20260914-add_iris_for_eliza-v1-4-e8ccd9b8cf7a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-add_iris_for_eliza-v1-4-e8ccd9b8cf7a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE2MiBTYWx0ZWRfX1l7kbXcD4sq7
 AKzTDjv1uRpGxPX1ES2wOdRYmunzB9CeM3PtqjeQSyJIKkXaQNSbe6/Oo87nppjPAIg8z0WnYFu
 grOqgtdw4W3dJIFIRUNb2qMvxqavXS4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE2MiBTYWx0ZWRfX940y+x4JRg5T
 4i0MaGRuiCiJY12asjTiJiA//YcQS5/BxZi3+/dc2txqygnhdQFQL68hUENzGtLrBHRSpP/chug
 Kz3cek2oJNauRmsIodHdRlm3Ll6IW0w8yPrgXSgAeT+E73wK3xAE2gbZaeS+oLwGFOc5Yn0wwvx
 8K6qnsIRAQ1VJfLSULnPLW0ak/JsbrFpsy7FuGq4if2eLU0yPZDBVayY1KjdNQz8bt5z9idJEQx
 9Mq7x34lnnmXNLfWoRUtqMOu6D5m7StS055Hbu1LFIlAfkg+DB7Q28iCfDhIe4Vz3/w4rf4kfLr
 wlKWi3wEXph5ABqUoHusgVqj3QapmMDxVnHs6Dq5LVU5S4ZOIe0c2cRt7vvKj6qMZjvEfTe2krc
 gxcijYLACUVVBmemby4vvV2BNippZ1iRloSyuds4VTWX3Z0XNqh2xN0yqLp3lVEOaUeeXOuPSoG
 4jPEQyXmN4FSMVZddWw==
X-Proofpoint-GUID: zrPPRmRWsmXa2n9_IaiSacv3gU6uHljU
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa7da0e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=zFfZ_-Fbgzo0WQ8s5VoA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: zrPPRmRWsmXa2n9_IaiSacv3gU6uHljU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140162

On 26-09-14 17:54:26, Wangao Wang wrote:
> The Eliza MTP includes the Iris video codec, but the device tree leaves
> the node disabled. Mark it as okay so the video codec driver can probe
> on this board.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>

Can you send this for EVK as well?

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
