Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A994342A15A
	for <linux-media@vger.kernel.org>; Thu,  6 Aug 2026 09:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786008181; cv=none; b=C8dOEKVF6KSOam4chxBXoCT0hRhAOnBn5m5yLwm1RCKwQE6f4dsC4ZyPcGLXk/jqE535IsfywZzXTV0k5G8viM7Uy4kZj533ykl/ZZe7Zls1bLBNWLFFLmNZZumvCRUc0OeHIB14CVJ5kARzeMgh24Fnvoatw23d5mg0hLiPDLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786008181; c=relaxed/simple;
	bh=dpY6Lb66UiiSVLUiNY/tDg0sHUc2lJJLguZEJbr1MoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OAnW79OWK41aB7BTcCzGSgt9ZxNBma2aZQujIgm/WEY86kWqOIltyxfGXCU86Fmz7fYbCOFdHlxi1gpGw8KQnydELJfxelBLmEwS3pa6hz10eE3FSyEeYk8Ivu2xDuJSweCSCEmnaywBttZrcHqkFF0Wnsyc1cQk8Jv+gSZIiV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hZ7bYg+J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zw/u7Kuh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hZ7bYg+J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zw/u7Kuh"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67694Bip1426390
	for <linux-media@vger.kernel.org>; Thu, 6 Aug 2026 09:22:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pqaJOMuddBQhzL/ghmNiBYFo
	sxA6nA8z5MJRgKzN+OQ=; b=hZ7bYg+J44WePbSRKs3FnHZFEgbIN/jkIDqJ8XQC
	+L08M/+kxTzNBjfrMG4Sy8404IJu57fv7SKb08ehY0Q14n0P1gowFrGTwkHXlfNv
	KxlFBdj/yd0kAV9a/U62UTrpHs49QIWX7TsbzxlDKhHkGR+GWTzgAx4ogVzK4Tg9
	lnOJ9Rck66Yn5duz94gHvJY4No1f3WWakYjmYZE+TisaVTX98JXKsxPpsX8pChGC
	Jw+NbTtnvR0GaZuSvdjx3nFw2nwOG+i5fH5nn9IFs7h3oIkATwxak3y6lne8xq4D
	ej+1YvK6FCJsGxjlRRC3NnUUcuwFKvNbDMN5IYra9SY+Jw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvn8prp2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 06 Aug 2026 09:22:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfe3fa93bso20479681cf.2
        for <linux-media@vger.kernel.org>; Thu, 06 Aug 2026 02:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786008178; x=1786612978; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pqaJOMuddBQhzL/ghmNiBYFosxA6nA8z5MJRgKzN+OQ=;
        b=Zw/u7KuhXGABA03ihjje+ZbK7UL5ET2arwuIhIFXuQkYggHOLXF1q+t+tUXiAcXVaN
         WvLhYKxYr99ceDt+LNwmiYkhED4s9IlNK8jcc3oqFCVAarXtADzOYzC8FKIToolKKQ6y
         mTki/GaJA6h0cF9ECUSygQrQrmxlOCG8ZsgDrygrkBgx5eqkmocJjPy6f7SrKDvmyS5E
         y3Mqd8siuMLIvATn/wgykqxu2PW/h5RrbcHP3dpmF0QQMD/fPdP3bGFGj0r7GwKfKGbu
         XRsa9J/nRnmfi+F6+bEriLKv0Rn6RZftGsdAN20hFG6HUVTNbW8nSxXE7a63aKsU+G6S
         wPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786008178; x=1786612978;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pqaJOMuddBQhzL/ghmNiBYFosxA6nA8z5MJRgKzN+OQ=;
        b=p5pbl3DI5kp0/opNt6XLjVKOnAajxQemHAw2RMnuJgjmhzrpCGMU9osWJFqfpAi5lm
         aefDbV0l5k7SFPx5xU/A1K2XU75ZdjGewHhPLcP57R3jaOC//slqHsj8cUwtuoxtEqLx
         +MeAnoq9llap11a6TQ1hnyVtHXaWHy0teOvPhMjYHuqhKF928rGM8Xkdxyczh0zq0Gmp
         5fa4Y46T+Bdw6mcTKfddHVALhuvMPGPwnjxKmLlxG6Jy1yYwEq5i3eIAKmSuny39/XT6
         C4BAdbuPuxSRTGvQPCDzh98Ik/JmI0EVlS1OATDgKPcU97oCEjj3t2bxAJMVGDEnX6eK
         eYIQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr4AtfR0qPzqKuM8AVxbHe5ZpvJkq+ExVxLlU6m+OCAeTTjQzkxIUR5qa3xpb360oRW+Yc+NxXzCai1IQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9eVpKZVZv+vSSJIBJI8n/GsPYGvziL/NNQf4Fz1jRiRLrpl8A
	PHoe8axmahrYeVaRqWjm6tN/FyGQXtUXI+SC7y6wSwM9z2KCkElV/SSOfkVPIot1zDYpLA4kdJR
	kYhkI5V1sF9xVrx9vABQngqNYAK+3Tt5IT/gsQNgFVACa99CmG1RvEgrf6CXeH48nUQ==
X-Gm-Gg: AR+sD12Rbff8lX/rEZM6+o8e3/TAUj4/xhd0OEvmZzTrVkqQAiFvLJ4231+rFHFj8tf
	H1u5ur3zrED7L+6VA7d9KerJ5B93Abfx4tTXZbE1EbOUvIxuQJLqASMIGhGK2jKK1c4RxviVbtn
	iJIC3ffKa0zsyr5NXQd2FAhdAmuEYtOHRXmk98myi70tKpQQFvtrI/M5r+/aNMH+D6BvYvWxTnv
	FyauYHhgqY4vZDRM6jhMmHJ696oUh89TBvsV3/PQyjwp3WDw+PdGEMOEyG7UnXxzjJozb9qwQao
	bCTpU1UvIN6A1KgySgx7pUSNWCuf0Evbll6jTLRI+Cd5kOlYRcnwT1CMPnW6hLoMDInqwaspM68
	c+g8zEMpaekc6x8MBYLSUoTYEg6uF7q1S54L6mywGm5v2gufVomw79Salw+x1F2NCQJHzAH2dvn
	9Q9BleVp+0lGrgBw==
X-Received: by 2002:a05:622a:4811:b0:51c:22c5:daee with SMTP id d75a77b69052e-52ce6133c6bmr146671621cf.29.1786008177360;
        Thu, 06 Aug 2026 02:22:57 -0700 (PDT)
X-Received: by 2002:a05:622a:4811:b0:51c:22c5:daee with SMTP id d75a77b69052e-52ce6133c6bmr146671171cf.29.1786008176819;
        Thu, 06 Aug 2026 02:22:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fb9a51048sm14086691fa.36.2026.08.06.02.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:22:55 -0700 (PDT)
Date: Thu, 6 Aug 2026 12:22:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
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
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, stable@vger.kernel.org,
        Daniel J Blueman <daniel@quora.org>
Subject: Re: [PATCH v2 01/12] dt-bindings: media: qcom,venus: Add context
 bank subnodes to common schema
Message-ID: <zqpgl3esozn4dgnm7remmwmquxasyc4qpyh3fgcdfblmn2xe3g@vhp5umdahvmi>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
 <20260731-vpu_iommu_iova_handling-v2-1-da52b5228dbd@oss.qualcomm.com>
 <20260805-dark-voracious-jacamar-6aae4c@quoll>
 <7a546bc6-a2b4-457d-ac27-05fc1cfe17f5@kernel.org>
 <m4rccl6zsdzmkzntc3njv3uczcppva3passjr5ukmru5q6rylx@wlwha7ydttfp>
 <163c24ba-6b78-44bb-afe9-3dcbb4d47475@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163c24ba-6b78-44bb-afe9-3dcbb4d47475@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA3MiBTYWx0ZWRfX84fYQqwkAXv0
 cy+m3t4qZuh0OMOGkxa05oWHEt3f0mFa+qAEnudZPhz3zWlhp0dbz9j97kZd2UtUnBsI9Ahusn1
 pQQw2Ur+46+hMBlHDy3YdEhqDu9ZIb4=
X-Authority-Analysis: v=2.4 cv=RPeD2Yi+ c=1 sm=1 tr=0 ts=6a745272 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=4vcYjQK5CgZr8qocVmwA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: n_miYrYMzdBSRGN1mZE_Pe_x3pV1bKDo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA3MiBTYWx0ZWRfX38dwCXiv8SH2
 5t35OFPa5Rsb9e0i+drKU92MpFcHNU/gz2mcT2VxJtlUFI511SE7V/QY6TAdGfFqEVKRYzxK9Ap
 jQyfPWyGIIXY7707d8GNuGMjgOON2C0BPQ53wiUHULyiXsXhIEOeljOl1+53CTXCjoL1RJlt4zD
 i7U/viBFcYw74riDWWgbbnC4U974ClT8ao3aGfKvAbowER9S3ObSvgRtowr//tXFyTwMPDgMrwr
 Fkyhq2VNIjWgpYC4P32HpOyrO94uSpQ7syO3UbyRshFwkl9FNUHcL+g5s6fHD432aHNZqg0fScm
 fSjeSutx718rKGYTp9c+tJLVIHz65OKngqpI+Twv7uWRgthvTKVCCr+QUCwtWvH/p4F0ypf65A+
 AVyJDwDNxFpo2t6GbOGaDhu4h71dSidPJcCzh7bY7IBuXd0sFGS5wcOILHIhysrpez+TngKMQMH
 MYcFlKH47doAPExyCBA==
X-Proofpoint-ORIG-GUID: n_miYrYMzdBSRGN1mZE_Pe_x3pV1bKDo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060072

On Thu, Aug 06, 2026 at 11:11:09AM +0200, Krzysztof Kozlowski wrote:
> On 06/08/2026 10:46, Dmitry Baryshkov wrote:
> > 
> >> dma-ranges tell how this bus - so venus/iris - performs DMA translation
> >> in respective to parent. Address/size-cells are obviously also needed if
> >> this is a bus with addressing.
> >>
> >> But there are no children with addressing, thus what sort of bus would
> >> it be?
> >>
> >> It looks to me that having here both:
> >> 1. dma-ranges + address/size-cells
> >> 2. children without bus addressing
> >> is some sort of abuse of the DT syntax. It is allowed, but does not
> >> really represent hardware.
> >>
> >> IOW, dma-ranges alone feels okay, although unusual, and it states proper
> >> DMA translation for this bus. If you add address/size-cells, it means
> >> this bus HAS addressing and thus YOU MUST use addressing.
> >>
> >> If my understanding is correct, then solution would be to add addressing
> >> to the children (so unit address and "reg" property) or drop
> >> address/size-cells as Rob pointed out. [1]
> > 
> > Doesn't dma-ranges require address/size cells? In the end, how can you
> 
> I think it does not require, at least how I understood the DT spec,
> unless you provide actual addresses to the property.
> 
> IOW, this requires address/size-cells:
> 	dma-ranges = <0 0 0 0 0x10 0>;
> 
> > specify the DMA address if the device doesn't have addressing at all (or
> > MMIO-style addressing)?
> 
> Yeah, that's why having here children without bus addressing is
> confusing. I would interpret it that, children are not on MMIO bus, thus
> the venus/iris is some sort of proprietary bus with no mapping between
> parent MMIO and children nodes.
> 
> If there is no mapping, then we do not have 'ranges' property. But I
> could imagine that such no-mapping bus still provides access to system RAM?
> 
> Actually this feels like a huge stretch, so I tend to think that the
> only reasonable option is to have children with MMIO, which would make
> it explicit: Venus/iris is a bus which provides translation of both MMIO
> and DMA addresses to the parent.

But there are no separate addresses for those subnodes. Would you prefer
them to duplicate the addresses of the parent node? Or would the
'ranges' be enough?

Or, thinking about it, if Venus / Iris have 32-bit addressing, then
dma-range should probably define the limited DMA range.

-- 
With best wishes
Dmitry
