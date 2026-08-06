Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE750427FA3
	for <linux-media@vger.kernel.org>; Thu,  6 Aug 2026 09:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786007263; cv=none; b=OdMQ/NpiZ+j0sb00BOvGIB1lWhxhTf34Gj8zQeDX9DHB3KES/FZc9i/1INDOACq90n6VMt0Pd2yAaolQF+TCPwkG/kbVHUux37CdUXgtNTOX1kQS2paUIFCkPu6ejVOdYecblKWCNEvit/bwHyJOGP5AYaJNxmJAbGZTguKkkDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786007263; c=relaxed/simple;
	bh=O56IjrYZVy1txanekd4a+mSHNJARh7hEqI6+c25ZKe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nJlk48bsepwjRSibrrq2LPCP89sbgRKpJ0gOy8cAh/tbqWsN1UVHPdA3b1oWVWmOVykoi0GT+oy96LdeHI1MiJTqgR/jcHnWo8/b8JjARPvknTSeBQlskI0MEXWp2o5wY01COLJHtLFRMKQy8Sod5MwXMPzGpc1O7++zUref774=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jbx6XGQP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OrBlsTtq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jbx6XGQP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OrBlsTtq"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67694rif2618275
	for <linux-media@vger.kernel.org>; Thu, 6 Aug 2026 09:07:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pVdhjrlK67ecZQf3ygFu0NnR
	FJPr59tUcYER7jdKMM8=; b=jbx6XGQPKr1cgjiTQut7aqJyqwWFuuSPF7R3AVVD
	BQQKYsw3dji9MLJO0Vj6NUpzN80X2FFMQbTJf1QZXM0n4yR5PwL8hZ0WH0JCCrZJ
	HUiVrQ1RFKUllV7ywyWeDn8uoIUyxDiaA/341zwbTyNBSAbhwoVgtV8jUAeO2FOY
	uBaDT/BLBgowy7/WeLD9QLZe+3vxnAwWqfGAmvjzyN7vgN9BlrEmzDMGUR/VeQbd
	wQa3UmYs3nybon3tLI0yb2yfrLm9KVt7zgj0CG4Lyt7ndRUsOGL/xgrN1KE632/O
	XlF7mBf/5SRDM9Z+4C1PbcA2yHHidS6ojlnVmBXxltNR3g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv9dmkbt7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 06 Aug 2026 09:07:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5276aa86d00so19275301cf.2
        for <linux-media@vger.kernel.org>; Thu, 06 Aug 2026 02:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786007260; x=1786612060; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pVdhjrlK67ecZQf3ygFu0NnRFJPr59tUcYER7jdKMM8=;
        b=OrBlsTtqa3fG8jSVs9UiAUEXopbNRFbUvBZvjRXXNE+yM0S5HNnDw3FvS141LNxtc4
         MVhapBLpgcBXOZ3L+O6JBqpsJQ8yhUu5XCzP+SrjJKowZAbAr/SRHT97T2e3PlpDJVDr
         EAl+rJpfr2Ztd9oNsUyPgHNofITTvrWjenyU47eXOxpoxMchFXVKiTc04HTgUSkaXBOn
         KfitZ9LUJk+P38UtxFoGLWJd7J6ApRQlMHP63s4CHU11wfA8sqzggWuKJWzDEBwCPrYf
         F8CtKximLpg/lV/NRfOAJIzV+HMkUrVIDL2JMyQvjnuhAodU+rK+xyBGvJKev+sQ/FNd
         3JQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786007260; x=1786612060;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVdhjrlK67ecZQf3ygFu0NnRFJPr59tUcYER7jdKMM8=;
        b=TW6561wHSZl/VwY+FLZgg3VYj/t995N+saV8PuzlXsizjtzDXj8slM44OLaC/aL4u1
         ZBUnQQMYLuLoI5vns8lpKDaf+T1RmS+9N90/mg8PTkZJf7fPxxKFf/yILcUdZ03mmweA
         bqy7Cy2jD/Z2GeR4+X4/EQpra5TPfPLGnKaBwZjffwCtPkfvTVmPe3MlFLIs+zSzgIAH
         Q2KKtoDLZUr7oEPx5oXuodHH3myOGCjDgpt6Qtnw6HXzWrj0gnCT7sNa/dU45xgmjHeE
         TrcbJrlTsDMOWyJTTQt3uo+9XLV5YFzN+/DPbbIJW0D0bPTS1Yk+8+6/BZ9maau5Cs4+
         q47A==
X-Forwarded-Encrypted: i=1; AHgh+RqAlwuZdva2rpSbrOFcS5Y8QvSbGzMjeA8OCz0kNP5+d5Aii5yZ2YcZqgz7TYxAHWnoujzhRubskZdJAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YylBK4SZAXOm92HCgwUdFBcB06She1fjb9F69hfhkvItPfwreWV
	OVjsT0Jq3SY5g4KZxQ5h1rJ0kB3H8YQXMFWoPU9vCzaUMgrCoWwil0C+gh3mrEzcOy2ZeCx3dZ9
	AdwTb0iQzUlrOUIyyBFOtLY9Dvn/S21cMA2wDbHEj1LhlWmCBHoks9YAGNw/Ahs/OkQ==
X-Gm-Gg: AR+sD13xKo8jJZX2/oCVkPt5QiLczlDyiJ/KjTD9pa/mG96Z5BVYCIVeEQU5Tb0N5YY
	RLUUWSycQk0yk3MGNkYPMskdkBBuPRlvPvWbn3pUaAi8wMDWEb+qL16VOOpE0TIgJObKAJWmsJ3
	iCLOLDLE7+0dG48+DEAor02n+1DGh12nWaX/FNtfDQqqfQFj9Dqv50bfTCXAeoUo5+VGzkJm4s/
	80cYQAySKmafQpZdbHI/gzSQdpdOnspOCui1hiZr7CMNJBI4MeNjC4uOzFQb5QMW24rTTfNDTRW
	GeFs1XK+09HmqUNjlYxbvwjkovcYUeN3gtIuA6+CkLSL5Qcu7BZ65xhwux55c5gwuUcEhQcIWfD
	Lv/RZyFG5gXxOSTOb+2DTpG8NTiomL85iMYvgk8mJlJwIGwC5wH1+2mttctbDi4fNxISn3mluYV
	d3+Wg4Ql+kF4gM7Q==
X-Received: by 2002:a05:622a:8893:b0:51c:f8f:13d with SMTP id d75a77b69052e-52ce61bd900mr138669791cf.37.1786007259847;
        Thu, 06 Aug 2026 02:07:39 -0700 (PDT)
X-Received: by 2002:a05:622a:8893:b0:51c:f8f:13d with SMTP id d75a77b69052e-52ce61bd900mr138669251cf.37.1786007259353;
        Thu, 06 Aug 2026 02:07:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2f62ba55dsm628438e87.59.2026.08.06.02.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:07:38 -0700 (PDT)
Date: Thu, 6 Aug 2026 12:07:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, stable@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>
Subject: Re: [PATCH v2 07/12] media: iris: Create pixel and non-pixel context
 banks on VPU3x
Message-ID: <4lhoiiuaiathwqscyvm2ruqfqnz2bzjbfe7s7tqbcxfcqphjas@u7vvrj2scxi4>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
 <20260731-vpu_iommu_iova_handling-v2-7-da52b5228dbd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731-vpu_iommu_iova_handling-v2-7-da52b5228dbd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TJR1jVla c=1 sm=1 tr=0 ts=6a744edd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=t9ty7G3lAAAA:8 a=tVGXqi5cNi3EYtfxDGUA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-GUID: lnryX4dHd_FfTql0wSNIslP999GNDCus
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA3MCBTYWx0ZWRfX3m7X/DvfLfzH
 xrTPZc8l1yTHi9lGM8o2+pI4hGCNkAOYPvAMAWmetNs1PMvfHlT31qLYgL+nFB7kgzBXQLKWmvw
 BDJKy8pK0/UnRXODqil5Lrr9XPDrUdI=
X-Proofpoint-ORIG-GUID: lnryX4dHd_FfTql0wSNIslP999GNDCus
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA3MCBTYWx0ZWRfX28IVkDlA+iPa
 2yygCUzoKj7ZYac1CELiSeCfaWP20MQS13v1Z8hgKbe4fU2r1Whusozel/6h9tvfblzUnvPXZcc
 LGw4mJFoi82Dw6mNQBITGAPLGccNyejdDX2M27TCLj6CijlVO6yJluFWBrSiIwvaudlWkxk12pT
 mYQD4mM7GZ/s/lXLR5pMHaPOk8NRwRufRA+QF1NXyyomojiNiaj3ZaIKpku/ARJgSeC8lHyossC
 jC4i8iAXLnADNVn7VTIhLOpOT6AM9MTNmVawkZclzDu7sOdLwniGfkAIEu0gt++MQDYpcaM8nJB
 /avwjgxUwghCiAowAJePMP0W/mDgr5neUjM25za62MwvzqiqEiMk1Y3d92T9XKq5EPeSCkbtfc4
 yaXAu/j71uMWxCWd2jcLEOIYHkGS0ZXnW7xM/40YWLNbzHJR6NXxwUPku5+AjxVJEUJx67Xy5mu
 81lpJOYuMBVfi4I55Gg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060070

On Fri, Jul 31, 2026 at 11:52:22PM +0530, Vikash Garodia wrote:
> The VPU issues DMA through several SMMU streams, and the hardware does
> not give every stream the same addressable range. The non-pixel stream
> is restricted to use 0-600MB of IOVA space, while the pixel stream can
> address the full range.
> 
> Implement the context bank hooks for VPU3x. iris_vpu3x_init_cb_devs()
> creates the "non-pixel" and "pixel" devices from the matching device tree
> subnodes, and iris_vpu3x_deinit_cb_devs() unregisters them. If creating
> the pixel device fails, the non-pixel device is unregistered and its
> pointer cleared before the error is returned.
> 
> Wire the hooks into iris_vpu3_ops and iris_vpu33_ops, which cover the
> platforms whose device trees are converted to context bank subnodes.
> iris_vpu35_ops is left unchanged, as sm8750 still describes its streams
> with "iommus" on the parent node, and the fallback in iris_get_cb_dev()
> keeps it working until its device tree is converted.
> 
> Backports are intended since the first DTS of 8550 binding schema.
> 
> Fixes: 41661853ae8e ("arm64: dts: qcom: sm8550: add iris DT node")

Drop

> Cc: stable@vger.kernel.org
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Tested-by: Daniel J Blueman <daniel@quora.org>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu3x.c | 38 +++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index 3dad47be78b58f6cd5ed6f333b3376571a04dbf0..623a0f8a7982c0b5c2e3741a34c1367e9aaf4e27 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -254,6 +254,40 @@ static void iris_vpu35_power_off_hw(struct iris_core *core)
>  	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
>  }
>  
> +static int iris_vpu3x_init_cb_devs(struct iris_core *core)

What is 3x-specific in these functions? Can they go to vpu_common
instead, as they seem to be applicable to all generations. And also, if
they are common, do we really need callbacks? Can we just call these two
functions directly?

> +{
> +	struct device *dev;
> +
> +	dev = iris_create_cb_dev(core, "non-pixel");
> +	if (IS_ERR(dev))
> +		return PTR_ERR(dev);
> +
> +	core->np_dev = dev;
> +
> +	dev = iris_create_cb_dev(core, "pixel");
> +	if (IS_ERR(dev))
> +		goto unreg_np_dev;
> +
> +	core->p_dev = dev;
> +
> +	return 0;
> +
> +unreg_np_dev:
> +	if (core->np_dev)
> +		platform_device_unregister(to_platform_device(core->np_dev));
> +	core->np_dev = NULL;
> +
> +	return PTR_ERR(dev);
> +}
> +
> +static void iris_vpu3x_deinit_cb_devs(struct iris_core *core)
> +{
> +	if (core->p_dev)
> +		platform_device_unregister(to_platform_device(core->p_dev));
> +	if (core->np_dev)
> +		platform_device_unregister(to_platform_device(core->np_dev));
> +}
> +
>  const struct vpu_ops iris_vpu3_ops = {
>  	.power_off_hw = iris_vpu3_power_off_hardware,
>  	.power_on_hw = iris_vpu_power_on_hw,
> @@ -261,6 +295,8 @@ const struct vpu_ops iris_vpu3_ops = {
>  	.power_on_controller = iris_vpu_power_on_controller,
>  	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
>  	.set_hwmode = iris_vpu_set_hwmode,
> +	.init_cb_devs = iris_vpu3x_init_cb_devs,
> +	.deinit_cb_devs = iris_vpu3x_deinit_cb_devs,
>  };
>  
>  const struct vpu_ops iris_vpu33_ops = {
> @@ -270,6 +306,8 @@ const struct vpu_ops iris_vpu33_ops = {
>  	.power_on_controller = iris_vpu_power_on_controller,
>  	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
>  	.set_hwmode = iris_vpu_set_hwmode,
> +	.init_cb_devs = iris_vpu3x_init_cb_devs,
> +	.deinit_cb_devs = iris_vpu3x_deinit_cb_devs,
>  };
>  
>  const struct vpu_ops iris_vpu35_ops = {
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
