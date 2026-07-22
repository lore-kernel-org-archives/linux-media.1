Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE2036A375
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 06:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784701585; cv=none; b=mL96Nka578KGvfinvN2ZutJQs/YTGP4jNGsvxj9PxIJJzvFqB+ZxgGe02LRAntktFSZMB72lFYyay4uQ3P9XWj/+Mv0SOc7Hz/GuThyYsuriOlEV52a7afuAl0gdZZ1LLXfn51YLsY/HbyhV/AWdF3dLUmXkT6mURAI23U6CsJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784701585; c=relaxed/simple;
	bh=ANWqAyRMt/cbgEm11tuJyzpAvdtzHqlsryChIh3tj18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eKPQchdSRdnybWUAIM2IKWm0d3JjMcaRwVrS8VzWQKfq4TiTnxiZL5oZIRwneIXGVqYjboDShIwip1FXW7hfMvJef79Hm7lZImInF8w+uSun8ZqLnNSlQRej3G6TiuIBcUFC7cQOxZmoOGb8Soll4ShNXJ5kFyuHVCA/02OhM6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HqCEdssq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cbVJ5gnd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HqCEdssq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cbVJ5gnd"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M61sTs984434
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 06:26:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gGbgei6b6aS8ASTNJNECuJ+8
	vcnkKt5wKDZiufHMYFU=; b=HqCEdssq0klyMc6rTS9Eh8duA0xUEdLzSBHLwm5K
	qnmCef+OIT52xTguxcEh3CAODvoHxg/zAUi0t7WHQeVqdPLe5hzVw0p6j0RUh49/
	sWDToenazpfb9Tns+XQTXmK9H/8fCWfIGXJpmzw7ziuA/uBIjdaoxW2E07ukFZWL
	B6JKO9VZV/BFznkqOqRy4X8hkFJXuOr8WvpwT+mmHToq/b09n/dDIgI5/MIbFpGi
	HaKvEPkdhQJ78SUYpYn5nPNR+e+wcv9XL5jYZ8ZSNa8nfYHyIunnSHa4F8N6rL2Z
	1PLsOaJ6zuHzaGDibotAyRn0ps9zvGPSIxDdGSHeR/a1dA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjr83832f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 06:26:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d137a68so332840031cf.3
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 23:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784701581; x=1785306381; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gGbgei6b6aS8ASTNJNECuJ+8vcnkKt5wKDZiufHMYFU=;
        b=cbVJ5gndkTF8kwRoJddF0q1XxJrH5O//+n5d1GTDbIUirrIg5TAnHNq7TLDF7EOCLE
         O+GBlMRL2Tcn2yq+157jIpaLykFZu04TNFTahV/z4XMJjdBNA3szYDJoXMLFb6KMvL0X
         fRHAZqmdDaWkfwe+MuoiEBArX58Wo3tSEf5zw35CIYBgilcjM1MW86ch2eRNR4/GWosy
         PCRhFD8PM1QuEr/5XJu+gW9rB1Pk9AsZjUUHX8Fp82zraF6++29UwojyvPtIyRyP3Yld
         Ojaqgf56shDosyXv4QDUs4yCD+z7mgzJTYeEM321/8aQe23jOh5Oy8T4OV6XEiiC4i5i
         1gnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784701581; x=1785306381;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gGbgei6b6aS8ASTNJNECuJ+8vcnkKt5wKDZiufHMYFU=;
        b=S0e4tNLXqNEQT0M2etQkTbgRnypBr2TIqY2/fQsWHcyIn8Vlq4dB2GBgXPHH6uhxaz
         Jx65/iTYJIDH/ptyCYFeTxAVHijhJZ75O4xZwyGY1H+aB8i5WW8/R0j9IWItN3V7CQkW
         5GznCLNkNhQ7vNfBVADMtcFl1G/vWGZATZ40UwhsXzHvxKBsrccSVbVF2Ff9+eDvVH8n
         jOoAcqGlSyyWLwaTVA8aFA8+Ln18OCFNX076NA8hALu+/T3KGaFgFQafqf5tbJ2J+hk9
         HgTTnFXt612WymgoZslIUH4oire1lU1+IWAZ+Lhc5z0zqkqRcl4YGfvCYa7gPnciEFyg
         kd9Q==
X-Forwarded-Encrypted: i=1; AHgh+RrXSDyAM3YcMyL6ZBPvCwfn9J6lKfrFbFTDA3AOeHMBgf1I7D/JmkHLPwzVGdYVnHL4dtkdg+texJOukw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGv0j+JqhELV/EIhP4QeKJ/tFlewWqgjNMe7ANQaILjXRPaJ+Q
	EUgWRwNjpcw5PfxpcxR6d1qE3pQhz4SBA2UMlJ+hi0BKQXoFaiGRD8QKEySZSXPIE3LekadJuXg
	A0etKZ9pTmMsr4cWIeVisGaBq1O+yV/EXRqH+z3x9skhjicxe8IT8xZuuVqFOv9JM3w==
X-Gm-Gg: AR+sD10Vkhl0hTFxoCRxQPi4rk5kC2zv1EMWSTKL9gkFl4TyoSPQoNRthoKcrQlxGPu
	63V5wjDAgzJ8sR5Cp3AaJae27obYajwUB/p0MREuqzivDvJOYzDpVOBXmBqK2JT0bBMzHSpgc/W
	cwXveDBgb0+lujRiubvRBrnYIoFhIpdh8xbfhg8xU3bAzpxdpra3NE+iTFalSaACBFFIRDMd6vz
	jVEYHLe0OFSzrkUqjWKaBTlL4LA3J5GACAIkQYyYC3Mnr2jIP+bF8ajN1IEavNp4SlzFvAm7gCl
	P5TaGmtgnpjPSjXPO1Sfue2tr91n6e/W7B26lBhHhiB6jJZKtL2YFQYN4Ad6T9hI2P8/baxYK8y
	+FJMej7LnThyUI2Npj5welIpsJ6gUT1NE+3XVZCbO6UDjGQPu3Sjqmzh1BR5L2q4En+S0cHILZJ
	E0pzjH1kaO7+UWcw==
X-Received: by 2002:ac8:5909:0:b0:51c:16b3:351a with SMTP id d75a77b69052e-5213c8e2e55mr203299821cf.1.1784701581037;
        Tue, 21 Jul 2026 23:26:21 -0700 (PDT)
X-Received: by 2002:ac8:5909:0:b0:51c:16b3:351a with SMTP id d75a77b69052e-5213c8e2e55mr203299731cf.1.1784701580638;
        Tue, 21 Jul 2026 23:26:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8c00bsm290004e87.3.2026.07.21.23.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:26:19 -0700 (PDT)
Date: Wed, 22 Jul 2026 09:26:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 4/7] media: qcom: iris: Remove dead assignment in
 iris_hfi_gen2_set_tier()
Message-ID: <fdhgr3wow74em47qnwsyx4u2ysytcoc4zyus4gkegqyro2qhc2@yzgehyqpuxig>
References: <20260721-iris-code-improvement-v4-0-4395bd8acfbb@oss.qualcomm.com>
 <20260721-iris-code-improvement-v4-4-4395bd8acfbb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-iris-code-improvement-v4-4-4395bd8acfbb@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 6CXNlzL15n9F2eXPzQ4sl5vIpY7RbEkC
X-Authority-Analysis: v=2.4 cv=VfrH+lp9 c=1 sm=1 tr=0 ts=6a60628d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=miKMHEkbYx8bjHyJJFAA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 6CXNlzL15n9F2eXPzQ4sl5vIpY7RbEkC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA1NyBTYWx0ZWRfX2GGXnNonDJ+5
 fGPya25pPdEASkKKEL0uj/Li+Yo0EDWiUTpv6J8W7SLh/tO67iuj/LAxI7LoAqHA4pxGlaXHGzk
 d5twSsYAvSa7/bKxFAI3KcmD+5fXQ4tI3XsjrDwjQObMl4Gf76IDdrwS6MYldR1BCPvzxF72Xq8
 bXCa1e5ZnyTrdA8P6J6ehRCNLlnbOxbT+Lk1FJcwhkuLzUmgKeVXtkWRt6fK23Gy9eCek2ISylZ
 yQ5FY3CXmpoNIWOO4buVeHZ/y+/U/1bzuMAbNZz7/q2CWMuUhoalWUdggpPMK2DRq8ayGF+bSMB
 9GjlZEmzlBBs7jdwWWeJfnTnhJ7cHBKocTkYEKms7dW3P/SiEKRNp9o/7Qo8AMKMg8IyuHn73FW
 Djdl16rau1ORDK3t6HqYuYF8lGPxkbivH+dTbC3uwTJpl9D7kkreVKIPDqe6dTbPcHrOBGfzUbj
 lNivXjZMqGs1L0RBgkw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA1NyBTYWx0ZWRfXxufbXscTvm1Z
 OeehrTNYq1Qpo4wQRCTAMFyZcu8M1GQnQFdwGnaHMBjSN7TttBvrOSHWMahasZdGhUnsmPShVS5
 b3chOUFAnyKJfS0MLoiYmOVdGDmNKMI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220057

On Tue, Jul 21, 2026 at 07:50:37AM +0530, Vishnu Reddy wrote:
> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> 
> Fold the ternary initialiser directly into the variable declaration,
> removing the dead store that was immediately overwritten.
> 
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
