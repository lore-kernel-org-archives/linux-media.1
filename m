Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4A1486648
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 21:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787261377; cv=none; b=qhZtb0S4LlhXCPAwK37hjWeMtKPR2ayz5rC1kP/k4TBNpLX6UuDO1gqfVtGEr7skj4w/O+8VH7tPf6Qm877dVnpVW4Lht7gHkT6BPKskE/M9SgGZTWoWQsmim/TTEs1i8FizA4fLjT4xiaoemMkMMsYr5ZRXgkkhfCi/hRQGwh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787261377; c=relaxed/simple;
	bh=3U8hOhcUaSM8cl7H3bgddxz7BYklyKGXNlS5hb+5tHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mJOEigOvU9MEBVL6Qb9mxawUnfIX1cQLyXi5HooU82L5SP3WZNDE5MFZ3R8ucjjlkjNtXbeaTHOZj72GQwwznR2YtwF5iMABTFDCEpA9ZDxvpRRQ4+CULv8WlJgCdvJfV56uqzIPxDVGnMZcBTFphWwN9eOrb+6gRhEBzpbuh5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UKmoS65s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fcQNv/T8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UKmoS65s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fcQNv/T8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KK87ff067150
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 21:29:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9uqQFxwRodtFqYlk7/aYNiLJ
	ChHVTsRqrvG2j+wl1c0=; b=UKmoS65sY/1qA53XAr8HAzNF3W2rJ37i1muVQ7m8
	jHwLnFlPzskQ8D+JEKe/SNMZTvy38eiDYgAVUNfRkiNz1dQWH4gduOO8Y5LDsBJ+
	iWjtKEse+PLr3qMi7UQ0+fiD07yHk7Nh8d6SVgCOyhF38VcvIJcoRciST1jAHKSN
	5MkBGWdcd2ZmtwghljdpX0iWE5N0gr3Dsw2O6l5b188Zy8yEcMfD+9E6/ba3k7rG
	abbJxXH0N9s6DjuLrrNjG9ANHuOc2SODLGn4aGulm2eJD1j1hYtWPuRxY/APcMvk
	ngqLxVQ2mgJbkRrfUnOuF8aIq58QYJA0fGZqIwCNewBbYQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg0k008-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 21:29:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52de05de414so3344671cf.2
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 14:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787261374; x=1787866174; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9uqQFxwRodtFqYlk7/aYNiLJChHVTsRqrvG2j+wl1c0=;
        b=fcQNv/T8cG93Ghve7jRTcurgv4w8oXZ+/EqzXgpkKWxGEjN/BoIw90t7RkTjBMczrj
         WOU9WYRbbknxaVOvJUjfwHzh8dfQcB2MBTb7MA0w5njeDLbqsAAqX24N1FnhsTrtCoVm
         gMAYD6VpDWWEgobTdCzoTUVAOyI0M7TD+atorLj+WBw/kxSck2S0ht8FNxgpYYwEW99a
         EQo/Sxn5N8B3Fzm/Hf9KyMv2w7bj7uGIaK58bb7yXHvTJ9dabL6HjXGJt6sGGEHkUFOE
         xRzr7URoAoHeFwCxEby5EmBOpq7mnTCjDSPonDiItWXqZd75mMWM5yRjziA2GT0sqBcF
         p1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787261374; x=1787866174;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9uqQFxwRodtFqYlk7/aYNiLJChHVTsRqrvG2j+wl1c0=;
        b=WrnPI9A24jnchl6OtxsQ7seTn4c9grFJ3melhVt4w19yDfmyH8OBfwoKvjcFtrABaM
         DQ7khoxnGtl9kOECEPGgnCrAGh5Pd0J1SS+LnpGIKpSE3FKgeno/gauAgOIwnxDBURjS
         xtrLIifj4nxB2p3o0CZ9nBkYnQh1+tqmKeJW1fAaWAyVYnUWw7B9yCuMY8ja4rA+0/qc
         2JmCZUlRPsS4t0NrqUiz4n6As9Pp2t8EUjlgatZ211u2Z2rYkwh9r88rBOefQVCX2UVH
         J2sQ0OMHv0lG/1z1bmTcvouej5yg6Gx7jodTtOW5bPW2mggrIqnWwcrKC8pfW6XVP5Zc
         daDQ==
X-Gm-Message-State: AOJu0YxYV3LSfo9Vwl6NsgX4gvnG6sDpCTkU54vyMSItFth3YUxUsTO6
	HWXBK1Pg5SJx/ysBqcWGubc3z5ZVQ4HmsKxTsVTjRCe+aHaaCGmlngpZEArr9EOLeLpiPDrALWh
	mnTc4qE/yFB6+pgWQBg06hnJcHPcNkEdzaSNpOZGWhsVnUd9XElsQnxO6KMR6Na5GEqWymW18gs
	hwb+E=
X-Gm-Gg: AR+sD12kNCN6qWPSKdiC0f02prBYDfy9USTWHFkGjbICGVY83IdWPePDATNiz8UzMnj
	YzEjsAixHmsv58lPZ4ZJT9uxXawI3In2K16P2A2zn6nVzDnR+wRg8T9SQQQqvQ9tAJGC2im+Kvu
	v6A1kpOdlB/ezrLCLMHMpVILKt0CZBd1J+cmbXzXBxym1KsPw4DMRXj6ecboD75RSAFwqhZPqna
	nNfvHbJqIB9dA65vRqhWF7sxJiskyvz59rxPjpGYGOR1Hfsti3nGOA5EEIQ4wax3m5+BLIuqjQx
	5F5dZaI9MxmfoFfPt4cnjwEpw93v6RTZOvGABSvWOKHGMoImdhRIpv6+JqNgyqDB+bXgx2wwIQG
	2DQ1YaSdmRHOVh90qz9JZ0E9elJMqYjzUPmyC00rvtAC3nO2yJi5kJPphljrnvGnEb9zkvWoC3M
	d0HVlwuQyXLaIH
X-Received: by 2002:ac8:5cd1:0:b0:52d:bec2:c34d with SMTP id d75a77b69052e-52df59fa01emr14900081cf.25.1787261374254;
        Thu, 20 Aug 2026 14:29:34 -0700 (PDT)
X-Received: by 2002:ac8:5cd1:0:b0:52d:bec2:c34d with SMTP id d75a77b69052e-52df59fa01emr14899701cf.25.1787261373882;
        Thu, 20 Aug 2026 14:29:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4788d9294sm1539670e87.40.2026.08.20.14.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 14:29:32 -0700 (PDT)
Date: Fri, 21 Aug 2026 00:29:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/3] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
Message-ID: <4hsy4gguawcbxbj4vdei4mlimb5b6gf4idnpcdq6rjyondn4ff@3wfuii2ogvzo>
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
 <20260730150524.2659577-3-atanas.filipov@oss.qualcomm.com>
 <vz6a2qugu7kkci3fcdkd236axr3ur33ghrgoopbrz3isueml45@b4frwo4l2hfh>
 <8997090d-1749-42cd-b9ae-b9c42f9e263d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8997090d-1749-42cd-b9ae-b9c42f9e263d@oss.qualcomm.com>
X-Proofpoint-GUID: 1Cm4Y9X96aOKltsSUoSQWTKS-3DoFLcE
X-Proofpoint-ORIG-GUID: 1Cm4Y9X96aOKltsSUoSQWTKS-3DoFLcE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE2MCBTYWx0ZWRfX1betIzEMWXG+
 JNF6aFaogijuj7xqjfvhC0BmRbNTCzp0KJqWvBkP7jz4zVab7GoYATtdTQntcfR8ko6ALGZ8zWj
 vkv9YN3F3YCVGvKU9OPCMX7FMrdELnBinz4DJk6XGlE+0ersp23S8pBvX4JBQhSOJ8SsqsGYhH8
 9hLuYiKOUdHMz5AB98rvgKktJJpwGk4LSEmnQ+I8n3HaUh2ALTHtTj99UuMdA2tSXVkgkAKTyIt
 aALURf8tD/Sn0QP6bT9ZSQiz1PbozRdrATKD2kmJ1CWW83ut65Dvg44a9XZGPG8U/btpfhZ0zgB
 PZEIuyjSH3JkoWqqw1s65xMDp28+8xEtV2pExihVb6vAoap2KUrdcVXeZOKjlymcsmFsWWZRywB
 SmFPFhftqhsDvHMLgINv8H9ErbOfGRjcQUHKYnjVFp3ekYB9Ka+2GdZWPC76T3qQYhY7cNDIVfp
 cLKou2iH0tDhtkuYi9g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE2MCBTYWx0ZWRfX73chq59IMIg9
 84JrAGYJrmyCeDlE6PaWqVO5dRjD9URyDwY2++++Z4rCaXUotvndBLVNJP4shWEN6vWX1NM/maf
 HKbUeOusDyReMURgfBn8qzmGfolYioc=
X-Authority-Analysis: v=2.4 cv=JoXBas4C c=1 sm=1 tr=0 ts=6a8771be cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Wzl9js3sJEcO2ZUYT1gA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200160

On Thu, Aug 20, 2026 at 09:38:16PM +0300, Atanas Filipov wrote:
> On 7/30/2026 6:57 PM, Dmitry Baryshkov wrote:
> > On Thu, Jul 30, 2026 at 06:05:23PM +0300, Atanas Filipov wrote:
> > > Add a Qualcomm JPEG encoder driver implemented on top of the
> > > V4L2 mem2mem framework.
> > > 
> > > The driver wires vb2 queue handling, format negotiation, JPEG header
> > > handling, interrupt-driven job completion, and runtime PM/clock/ICC
> > > integration for the standalone JPEG encode hardware block.
> > > 
> > > This series targets SM8250 (Kona) platforms.
> > > 
> > > Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> > > ---
> > 
> > > +
> > > +#define JPEG_V420_HW_CAP_DOWNSCALE_POS 8
> > > +#define JPEG_V420_HW_CAP_DOWNSCALE_MSK \
> > > +	(0x7u << JPEG_V420_HW_CAP_DOWNSCALE_POS)
> > > +
> > > +#define JPEG_V420_RST_CMD_FE_RESET_MSK			BIT_U32(0)
> > 
> > What is wrong with the standard BIT()?
> > 
> 
> What's wrong with standart BIT_U32() when dealing with 32-bit registers? Or
> do you simply like requesting meaningless changes?!

It's called uniformity. Most of the code in the kernel uses BIT() rather
than BIT_U32() to define values even for u32 registers.


-- 
With best wishes
Dmitry
