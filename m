Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F349A35E1DF
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 00:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784680611; cv=none; b=X2Vtu6LyB4BzL7Ztm+pnwFYtGaIj7tZxml0CRHLfX+2sSCZMMyYsvaU+UJhR9XKHpGVwsi/A31gbLPQgnqRPLw+aWqyFsK+IeyQbHEq7wYMA8w+RkvreiChfhaWytrTOE/wfiiEv9YNT0o2jCon+8pvnJ62w66rwKuauEganj5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784680611; c=relaxed/simple;
	bh=eJ8JKhRAM+lrV0X/mYRJgYL2FI51fbKtrmhXLkf8Fmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ij2pnDnn6HTj0rCpXm0GQTFAKXoJOC/03rS4Z2Z89cP5h/+iperfa6PNndikOsh+X+Qoc4PF4jarCeVGrfXTahLrkRX2wchkZ9Fn8h6H1rfLvXpKOMaKE3AvpGSt8VHAVJkWDOsk2o3d0EBM04ow2FnXJTfRR5cbxjOizl2/Cgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m+//bsBP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SKxsRGxC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m+//bsBP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SKxsRGxC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LMZQwx3027073
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 00:36:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MoaiRsvPSa+MaxPeUK2X2xox0h/hrgZiaf/Vh6GQPzM=; b=m+//bsBPbhXIRG4R
	3mDetjJlxu7VSiSuaW70Vng7LSPSuLFdl0vzsXsklrdBEZE0vALpgK7E/QWU5Jat
	Fvevnigr2TJZaPNqOX3HXtsg9w0ygFUyxRbWsYf0F1ofaWkPLn7mRLZMUxVignqC
	aCG63kZvhPe+70qYDocfYPenBJ/tZ9vMEAUdzcC+YUhxhHNFYMTOAnfSwvfRn5cc
	FNcTmoQMqF2jBI8ao6dBMY5xfFPcVXaA3+WwZ5Q1yrV8NE5UulJL9eOq9f2pbgYr
	AeLv5hUc1rLAio/rSIaOJi8rAeApKzLqVyE1TnI+hrbgIDpl9E5H89liw7b8h0pI
	RLZKzw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6pabhw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 00:36:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5276aa86d00so13161301cf.2
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 17:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784680606; x=1785285406; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MoaiRsvPSa+MaxPeUK2X2xox0h/hrgZiaf/Vh6GQPzM=;
        b=SKxsRGxC/NYtqnIQGpbsSoj6hsO7RKiYpjcvJnGO0yzG5s/ZLCOwn/3AQZbxKU/jFt
         ANte3zal2GuFR4L5fN+AUkv3zte0Jm8sEJRrQ4j8eVVM75h51m5MgZAjgSdNeeyaDPfk
         NzzQ2L0lBAzU7DVckAr2rIIDHpv12IGlErJGlZ4yMCURpDX7dlIGfQ2ft6zUeMw9E17y
         4uqGXc95L9n/DSBlXax6GTJTZ6xv29HFg98YCcQxTa4IDzEEyceE1mBFpVAxXVtKRdLL
         iFGKUbqWZ9mAB5MSFs4Ukg0sMEIA2y5IYTJEZWWrM+VFbyge0Z5uy7HdIQgVnrWSUY8H
         VI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784680606; x=1785285406;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MoaiRsvPSa+MaxPeUK2X2xox0h/hrgZiaf/Vh6GQPzM=;
        b=RQGkb6v1LUGFXAFWFY5+4ObBb/DnEmHOUr2HlsccShaPZh4BGzX79WPVPZbSK2e2wF
         un5zQZk5PaIlggmmrY+ofr+NoxEDL2ZjP9f//0sQEkGI/ztizQaFj/SmXo3hk+VjYmyv
         c3iOIh8TArC7Fb4t5cutWko6WpbgM5wAER9Y2x3kM2IWPwQRLUKDO71mwXgRRUJUifyy
         5lEercOy5TXVrAGOyWrF4wAIemWMD6Hpvi9iAGUBdW07uWesR5EUnsfN9spDipEZW1cp
         4V3MReVbTRp8gtl/0nTdQblkdjO6+0Z+VOEpvSHrLtRnhlTQcAecEksflK4NCAwACQI5
         mScQ==
X-Forwarded-Encrypted: i=1; AHgh+RohmVvNgE6VQgWgwp0DadD6Txs+kBb1dadeLG+fYVRozHBRKFMcYt76gNzrdV0z9lI2GzYNMsE6WQ6XiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzD58fN5Qxw8rq127AEjT0D0xFFE35+9TOg2h5WXiae7xFGKljx
	S03ZtBOrvoZoOzCs2gAD90YikRNftAMVUh+oRyxhjQhg99pzw3q+4NyJNScw77yYyxGhDVS9BU7
	F1a85jP5UayyDSe+RarQkBuD2zdlriBIe1BA01zFCQV1d7956BUpGKPllDA53Dulrxg==
X-Gm-Gg: AR+sD10qIS9faNaIzJJ7u1GbvcforT+JC6w/rYyK0d5ERIr3LALmcZj6MziLvnRYex7
	4qfMoyFgZx5XgXqS+rg6sgAblhZxJYO8QIJ33YZMKwmLE9QN6NNV6DHoVxbVGak90hoe9sZ5Yk/
	QHr81qDJJfu63AQjBUcWyLHHXMH9zviqu8+anjbGS7ikzpncuwGGcZBUcvmQv2ygHsaqJ5v6hrB
	kvcjGl+T7+3HOVzDD5KLHh8QKGuDcrSvqvaJsiQV8i8UZcDCJsCopEcLUQMVn6wQHTFYfw8Ju98
	6pcbMSTcxX8TdTY7/HCx2Jz/QDneO3bjzLfh4S9OhIGYGv6ib/Sf4lVSK4cn01zeFVLFRS6Xgl1
	S10x7GWz+M01xEFRMgFi0A6FdM2QQlKlOcL1hEeTIqW3F1W2cVH6tb6HsbRLQXU3YWdx+8kccsa
	NB3JcQcds6oHxrxg==
X-Received: by 2002:a05:622a:e195:20b0:527:f5af:9e7 with SMTP id d75a77b69052e-527f5af0fcdmr4750501cf.51.1784680606022;
        Tue, 21 Jul 2026 17:36:46 -0700 (PDT)
X-Received: by 2002:a05:622a:e195:20b0:527:f5af:9e7 with SMTP id d75a77b69052e-527f5af0fcdmr4750301cf.51.1784680605534;
        Tue, 21 Jul 2026 17:36:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d30d9asm188103e87.44.2026.07.21.17.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 17:36:43 -0700 (PDT)
Date: Wed, 22 Jul 2026 03:36:40 +0300
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
Subject: Re: [PATCH v4 2/7] media: qcom: iris: fix state-change debug log
 printing stale value
Message-ID: <duesueok5bwy7rh5bdjyt3l7lfojjjniz7zxq3z6fhofhkxmwb@wcad646c2vlg>
References: <20260721-iris-code-improvement-v4-0-4395bd8acfbb@oss.qualcomm.com>
 <20260721-iris-code-improvement-v4-2-4395bd8acfbb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721-iris-code-improvement-v4-2-4395bd8acfbb@oss.qualcomm.com>
X-Proofpoint-GUID: xWNtB-HwjMEiXuDrYP8Bf44Qn4PUMqZw
X-Proofpoint-ORIG-GUID: xWNtB-HwjMEiXuDrYP8Bf44Qn4PUMqZw
X-Authority-Analysis: v=2.4 cv=eYYNubEH c=1 sm=1 tr=0 ts=6a60109e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=aUN2rSNV_P4ZXYKtj1AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAwMyBTYWx0ZWRfX3ZjK3rQJAeqa
 7ybotxqsjv3hWF2iw4l3qGaGOqKQSypT+AxQI6nXTnBBznfy2EHpJ34uqqTqpN5yX7vP9HSNsqV
 yDQ30+4NpdG6CKdESMrNU6awiwiYE/cLi7Wqh4/Hvz4KbnIYp5mmljcI0XYp96l7Hngp7RB8YA5
 wFTylHcEcZUskREZbPh5gh3c3+Y44mSbVGGbugE+n6NkUt8VyeTUg6yQR88HgLeWp0wFacEYmWF
 ShbHGfQav6hBfV0k77yAOuDyrSr46EsjV6MHgsgXw/qRt9BlW92tEDxo+CjtX2/il2tnS7gdL+7
 OYvONLpeLvCNHKyEAj7sjkDQVAbPfkNjtqQ2tubi/wS3DE9NdUh3IROwuLSN33fu1nsJKcdq0Eq
 6lVQ3Vpkx56glaau9e7WOn4/Eepa9h4S0nIWCg60fVjXdKnYTzdMvT7FedIii54AS6UY9FAadyE
 WAlC6OmhMi8pSSe8cZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAwMyBTYWx0ZWRfX2ZjtqZDRrI3B
 Kx1+sjOuweOlzGjUToZla6HDv/3JDxYQEHotw7jS7WFd6W09y+xHB7s1BZMg9GfhvZ52uZW5leg
 uxHYAMDWvm/K9dtjBOrRToXKcQ+q2EU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220003

On Tue, Jul 21, 2026 at 07:50:35AM +0530, Vishnu Reddy wrote:
> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> 
> The state‑change debug log in iris_inst_change_state() always prints the
> same value for the old and new state, rendering it useless for
> debugging. This happens because the state is updated before the log is
> emitted.
> 
> Log the transition before updating the state so the previous value is
> preserved, consistent with the existing sub‑state handling.
> 
> Fixes: 11712ce70f8e ("media: iris: implement vb2 streaming ops")
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_state.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
