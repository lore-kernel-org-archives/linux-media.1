Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2713446C4
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 06:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784701602; cv=none; b=B4og3OXS4zD9+0GiRgqA8pwq4RdcYqXp/MACaKgPvA43JtzFdg+c16M7Z0nXIZuTaP7fWcSOOPwE+r3leSI148WLpU7/DD/bz4gFR8G311nPLYmTDThmmcfse3XDJYmY+W3aC1d3PQ66vpfqJEWa0e2gnrkieg6wdp0YWEc0YVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784701602; c=relaxed/simple;
	bh=B14hrMZ1sDb9gGqrenBhxTzRDdupq+Tu7JIRdlnhaEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DSWQ9ASYD88V3C/3ZCGGm7loJ9PZUKQMa/D5lCdSiBSG1fWQHvIYLvIR3Otdct2lpy7/xYXP+thETrwMzGCAIeW8nwT3X9DSsONKGAzRhkPnhhsTUnSojOTXYlWx1VvJKjW3+AK7jyLJDKPOm9SMCyL3//FAJYvTQmhu1itsoiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K3PGt7Qe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z5M53CJw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K3PGt7Qe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z5M53CJw"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M61psY984376
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 06:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1SkKvBAuLJm2jQktvSyzJDXU
	xtRqjv5cRcM89fYH3Z0=; b=K3PGt7QewVJzEWXkX9e6XCH7Gj/YMeNljWRwSAtb
	qwGWbB4O/UELpsX7QBHL/zTPsPiRJoIq+UquaUTr00jXKOz9nG+8WtUy7A/EwhwZ
	Dlbu4l+RMIZulvUYsLiB9eUk6iZJZ8rnU/Z35zGcNhR7R9h2ekkPjNSBAZBXvzQs
	jofkUniFt1Vz9CVKpGrZyQhVQfC2MEyc1l2xoFaGOU83FRZhYCuA/zDJJmm9XZC4
	dSmUpwoxJ5uJBPS4JFvX3mg4Rq7OztBHixGFsmkTkTy3BPP7YwS3lvdBk0BNK1Ns
	XSqQXV3/zS3JP06hcdflqg8lbpIIRzLgvezm4XZB6yHL4w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjr83833r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 06:26:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a23afcbso109862191cf.3
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 23:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784701596; x=1785306396; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1SkKvBAuLJm2jQktvSyzJDXUxtRqjv5cRcM89fYH3Z0=;
        b=Z5M53CJwhjLG7edU9n7PknfdQ0qvaUQcYBXADTWI/LonpfMeAhrwOK2kk+vXah5I86
         o0XEa+vTLrWlHPyxFurjZOyfHcrr0Rh92ahUCCVGJ8/CUq0qe18CV+cq3xAkNWNb/jby
         CtZEHv8nAXcDtElAWLaRmbdpRn8t3024wxqbcsdZR/SDTjCUMbEkVAJbnUNQsU1lTfKf
         HilPey430xs2EymUQs7KWDTz90dB/amcfN+Fmy3rhMHqLMQ48QSi9TDGIBc2Clw0xDCN
         nnZuHynSK4mwFab4ySMgWXwi0GzqsZohhX/D7wbSjmzLMXgZl+Who7vwb0PbQ8LHtTlU
         dDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784701596; x=1785306396;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1SkKvBAuLJm2jQktvSyzJDXUxtRqjv5cRcM89fYH3Z0=;
        b=JGPhSA+94FgwE6HPt8pvvIpERN63JcLy3Qz55UsYFLdKZfTWTnFgwyLohcT6qsteJz
         Nj9znRQnyRNjOTqeX6rfNlE9Q4m1yGfPXec0j0i5BgVaTEQO2YPGbhenPmXjVYclh38x
         Ar8p3ImFd0ngNYfXkgk/YOJRt7+b5OnwrgZnHgobBHNQsr3JbfJY+1HilXY6uxAMFiJO
         A5lK3rwiNCbYFq7X6TWBvrwEG3ttSzOo1K0o37jx/3495THxyyIFHxtpQiob2idkma55
         6ky4ws3r5FQMg+NV9MPOAJ4CEaqtNVzvYoFLFqfisqf2AEU/rSb18NkMC3DDsb8sQ9je
         bS4g==
X-Forwarded-Encrypted: i=1; AHgh+RqxRTUO6K7mqvHmbWmSAN3Y4UYf3qsLA/3wgjftA2+V3um1UxuFVFxI3TIbKjuYHQtgIMkKDSrbRxPeNw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr+OBt0f0p//JtvPMIoTJTv/v34kJgAiGfKkepbpIq2Qun2we5
	HwawUYjBeWr6pBgYovI3k4UUp1NBubpXHnOiajKOR7CQ0f9mJpo7o1GcgoBSDIKBHN7arTnjbbB
	ChWooqCAJRnOabgAdJtHiEu+rMbf3Wg630rFj7Ywdb1d+3fDAS1SE+OAMnuXgcQ6pTA==
X-Gm-Gg: AR+sD12bN98vVAi/O3ZsMOqKtdHLLnNozLr7w/kNTQ0L6mSVrPgytADqgoIEz3mhoDE
	F8RoYfZWyxKMhupmH5wFiJEAmFapsdO0lo6HVr2MkxPbAIWyzJiyk/4TPJ+wo8Uvm4Bw8C5V5w0
	wQYDFO/iKiEBLOsYYMzPgwayNRcS0LSIrtwOuArfMwEj0+6TgrPSCKoddlcbHi5B8FEOw4/hZRL
	JT8wWJCZ7H/c17cxW3GrQkyygf7XtPsjH9mrjrG3lJioQ5TJihaEU23wK6at87kS+y9WNCN1krM
	hoxK5nFg3SJ16K/V02QjK43hVRq0len1/g6TCvssvw+NCgu/7Ha3lhH4hKg1GeNLBw8fc7KphY1
	DOCakICEWQ76ErSbxasu3tYQezH3imMhJwhGvtukS0oMmeXqjjBgDgjf5k9R5nZVl7LY7a66/vH
	ZxAaCP5OCFvnaF9w==
X-Received: by 2002:ac8:5842:0:b0:51c:7b12:1201 with SMTP id d75a77b69052e-5213f274ab8mr207064381cf.79.1784701595779;
        Tue, 21 Jul 2026 23:26:35 -0700 (PDT)
X-Received: by 2002:ac8:5842:0:b0:51c:7b12:1201 with SMTP id d75a77b69052e-5213f274ab8mr207064091cf.79.1784701594907;
        Tue, 21 Jul 2026 23:26:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9f50b18sm289421e87.83.2026.07.21.23.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:26:33 -0700 (PDT)
Date: Wed, 22 Jul 2026 09:26:31 +0300
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 5/7] media: qcom: iris: Remove duplicate
 HFI_PROP_OPB_ENABLE entry
Message-ID: <pm23untgo3zctvqtkm5kcchofp5fyaqctp4xsmroy5lk6e7ouw@weqlbm6gm73p>
References: <20260721-iris-code-improvement-v4-0-4395bd8acfbb@oss.qualcomm.com>
 <20260721-iris-code-improvement-v4-5-4395bd8acfbb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-iris-code-improvement-v4-5-4395bd8acfbb@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 0YKPlRemSh7ZaVVttEKIKVjSlKMdIcZU
X-Authority-Analysis: v=2.4 cv=VfrH+lp9 c=1 sm=1 tr=0 ts=6a60629d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=hVsuJ96k3IJYCa03ZK8A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 0YKPlRemSh7ZaVVttEKIKVjSlKMdIcZU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA1NyBTYWx0ZWRfXy405x2OU63jg
 He9ILjZPYv1Es0MimewmJF7yf4km6eTeZV6atf9XVnF3uJmvrP+bl5xyuhWVqcwY1McSrLN47sn
 LlMmDEzgBnuXtrZ3qmdntbmq2codFe1CwEQIntLoPDLT2sq1MPIqWjoziMXofh2/PgglLvRlN85
 73S0CipvfnEv/VKMTK7IlTG+uoNukPW0MbZd56Addk9Fm4JFYngt57YmBJstkDcNdrXX1UR7XgF
 fw5ScIRq67gBtfj6MxS5KhPWbcYHC/a6Rw3Z0rp1+l+MRN+Z1zTtF0rFDaT1vYyNB5xrDSS/syN
 NPlBngAoz2NUbuEWmoBcCGp9VsFjerl/ynNVEaA40txnls7XwHFmw4AR0pnL7m0bLp2uatMtDhR
 UEEySaKe8WINno9V5kVkNOTO7ShTuu0Ogbt65S3de0MVL7BRfrHbghJXTrA+vxGkOQdex3hFeQd
 75Tk6+YP2TxYQN7lhRw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA1NyBTYWx0ZWRfX8stGAG5Zt+v0
 AIdOn5jIKx1Sl6R/PRO639jF+xezZNyKgUa74BSHkgNaa0Mjuvh8g9oP1dZolwMEGvCHMjXPGJl
 j28iOh5qo184d0M5S+9ZGOVbx/Dey9E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220057

On Tue, Jul 21, 2026 at 07:50:38AM +0530, Vishnu Reddy wrote:
> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> 
> HFI_PROP_OPB_ENABLE/iris_hfi_gen2_set_opb_enable appears twice in the
> dispatch table. Since the property lookup stops at the first matching
> entry, the second instance is never reached.
> Remove the duplicate entry to eliminate the redundant entry from the
> dispatch table.
> 
> Fixes: 2af481a459a4 ("media: iris: Define AV1-specific platform capabilities and properties")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
