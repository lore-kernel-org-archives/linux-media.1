Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A29383C93
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 12:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785500709; cv=none; b=CEZ4StlvL3NqqBjZOsWPrwxcFk6ZGEPdwu3rlsaHKF5K4WJV5dspvAdd973LAsPq5qDWfyxAIictMjWHMquQrq6WadUQXG5GEnTuADUiXehV6yWkNlfcMDr0Li693XTvispVci7+45b+Sx2Ddp0Gegz5lshjZyAyBeQIJDhjkPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785500709; c=relaxed/simple;
	bh=jgA9+92Q9rPvQCWeeI4dvtvzVN9EhGJdXsWniM7HmeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bh5g8ZOLN9jpakPk5QvcDQTmS504UUK2yYx3WS9H5BI2ro/Puet4otl7jJGtryrGrERS9k6GNraYd9CkcII3qtM5Venho3sanXj82T1yNtFUV2noW+or9xnytYXOBMx1n8fmgL0j2DyyitIuWnBBRYjGadKGOxqA+Beezzp/+/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XOqzULvD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g8wjFIwE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XOqzULvD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g8wjFIwE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBdA1n3371042
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 12:25:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Z54HanEuCNVlg2Yh0Jseuort
	qjgg4ScxpftoOIWrzrQ=; b=XOqzULvDyn7PDohy6oI0vNPl6IkZmEx3IsR72tdy
	pCwJ4pP6zvD3MCurdvITwHCRnQpfYphkEfItMOpHr124W5ntb71TWaYMdxB0gKml
	XzEfTxWVCdf3jcl2JZuBj7+DRIKda3bonQdPHZhFLRhDN35E5QIpJM25ahIgsPrP
	167whYf4XPNHNC6vwlrLCuTQF6CCMsdC5RF34Yq9ywMQOtvI+Rq81Wa/cX22EAcs
	OANyUZp+t2Pu+j6yvl8hV1TZbJEXNJsOZ3OtTEx78ZajbGs893KjVVI63kdJ+AUB
	6Nyh+Luc0HWff4C8P3TGcUABxTQD6eHDQLrRmycajq/FKg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru0y04ve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 12:25:07 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8efad04d884so20030836d6.0
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 05:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785500707; x=1786105507; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z54HanEuCNVlg2Yh0Jseuortqjgg4ScxpftoOIWrzrQ=;
        b=g8wjFIwEFYSrgiwUihcaoqxRwCEmrJ4AWkt4CQsVHeJHhAzUMXiU3HKwxbzsleZCtJ
         JE7khJWJpJKs4Xm9F1S/WdWu5DaRA/9BTy0RMyjhedLgNR4IEfRKas4sXqqDsvUcGE3n
         c7MppLXEJzanzbYpXnVHDbgO6MezXqcc4JHycdVNmyw3yQZXxfHK8L5kOuuRsn7N8CxZ
         qhJ3TgLkW48JcKV6keca8ANSm5D7S0/UpFDcEckkICPaOpxnUUCS4ApacmwpGItTEcwO
         LNkbFOYJ05BUImsiXNjRCZZBoqsgkNXFZOKGL8m2Sx2vHSCkIDFYJCNxkcrjfJohNVoB
         8jyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785500707; x=1786105507;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z54HanEuCNVlg2Yh0Jseuortqjgg4ScxpftoOIWrzrQ=;
        b=UIk3/mNVj4Djwk9KnyhfSa5xr49iun478WxynWTJx64G6/DG5+kNolLpbTEz8JYUSk
         IGDzfOJBrs6EJVlVP/hwKqNwRCB5BneNjqbZh9P7dqLMPo0bYggbsEbAwRPRUT75s7aN
         QHRH31XpE/TroCv4HteY91OboXtmEbgVjnJpI0wCydDRKDOAjqNvnsAh0zJYBj+miaNQ
         /IO7Eqas0GVaiZhswv8MGk8rVs9ZiB7Fz/buuZpYgWu9lBiMDZta+/22zgByQ0o6Ti7a
         ZKBLla/ZZE7C6SQLzIB2SFfN+RTN+aKLr/YZNTILWyNJL7UmS+OqofwwFGnl2Tygm/xi
         Ux4g==
X-Forwarded-Encrypted: i=1; AHgh+RrRzCdIiv3u1KUN/t7qDO7ZDVvroPg521jPzdyD5VWW7LPGNJk0vRVomtKwkHh69H0l8k/twFZNHzsgVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcdYcSIjbBvpNgCcBax/P4DqBvyopRQmU8d4U8moHS33R5vZzV
	tqWk+EuBrbo1GRAw9ZrDGDVKjII9NON+VEmdRycEaKHnVjv5G+wGNdDsF9wNUUlFY4yjBJLzKZN
	8uWoJLTKoiD4zMk2yNsnwdkG6oRYseD3WVNcpRwjwshVgSswBmmkXS91n+3ISoK9FMw==
X-Gm-Gg: AR+sD11gSuzKauNGEbuEveCgAl1BzLFOv36KKl0qxQRMRRJ31R2TtTLfQKhdqL6Gv/e
	UOwgwh9+HmP0oVUt1T55cthf4OJxwr4jXOzYP7mNF0OKCcSeYrt+g5eJxT94bO1bV48ZiPwcT5y
	cBxLq+Zonoyqk6IxoZALhNrrqjA8to8j+YNdkAgtStBL5dgIft6fmHOgiJ8ckmHwmYxZnLeKbbb
	UOOLFRKujq08BbNtsqMYelh9/OhbGYwIFt9CyMuPIXTr+vc9tvW0zZkMazfqCxduk+olSPSu/Au
	b3jBGAHWmZ+TUUFjCCZmNBlekeDpyYTjXgdyw5RF+7y3KTOi2jF9XmGKDnKvlBPg6kc83/PB+J+
	2LqsH8179iFsVIZFTwW1kWZZc8eu/SHTSNMOI68YCb4jOYT5vAwHzXIekYDDRaUay62oP0eyvEZ
	1mnZxlJgTsJK7DyA==
X-Received: by 2002:ac8:7e95:0:b0:51c:1fa1:80da with SMTP id d75a77b69052e-52b4b0faf2dmr23061651cf.40.1785500706893;
        Fri, 31 Jul 2026 05:25:06 -0700 (PDT)
X-Received: by 2002:ac8:7e95:0:b0:51c:1fa1:80da with SMTP id d75a77b69052e-52b4b0faf2dmr23061071cf.40.1785500706449;
        Fri, 31 Jul 2026 05:25:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e2456d7esm269506e87.75.2026.07.31.05.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 05:25:04 -0700 (PDT)
Date: Fri, 31 Jul 2026 15:25:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/9] media: iris: enable VP8, MPEG2 and interlaced video
 support
Message-ID: <ll3jwycl6rknom5p2dvsgkoaqitcptyk5zdos7knl7xny2uwoe@ms5rstlsp4gh>
References: <20260709-iris-vp8-v1-0-6af3ab578a7c@oss.qualcomm.com>
 <xbvyccur5htwxzxpqywtnh7orm6gwjxqmfh7qkzb4egqxhfv46@ilvrnxrztdbv>
 <0ff4bd78-1536-4246-a4f1-91f8294118af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ff4bd78-1536-4246-a4f1-91f8294118af@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA5NCBTYWx0ZWRfX/zua8RIg1g17
 HSS5UciEfK9T8D3BEyOm4IIUCBTF7bxDUrdnVHkFV/t8ZtXErOYx9JAhBXS4NPLgAb0i++0rYEJ
 q52RumL4xEmX45eFOQdAxLI1gS/75T4=
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a6c9423 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EiIT1U1qUc4YKD5Fr6UA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA5NCBTYWx0ZWRfXwfd91yM6qgZi
 ksRNYs6SgD38TPEWsildi1Mog6roxJWxL5e4hWEOw+3I1wP/WS4e+lWiIe1vonykOpoexW73/W2
 SWaF+KHqIbCvkdsYyg9XTBHKkEhSMvAYsHnSa5fK3OhilWfvWNAGBdcOMxM5Go+GbHx74DyWK+U
 Jn38oLyQoTDaVF45p1Owt9PPaZFhcW9sZKiEbG41LqI/JxlPwpH7JS+N9ITyp0wYplS3f5i16sJ
 6xtwJFtq8+uBdgVlUCaXSoDdvv+XjHjhiA+mZ13pFrFdTowKZrJwu0KdpCPIy/g/HaFk57xdHet
 Km83spmOduKX37s0u1a2FcCGV8VNkNE0VOSXklxHSP74uc5QwYVZvPEclcKy4oaSwcvCthOdXy0
 eX/6YO9I0JdY6gGV+Ohg2Bp4mqH21z9SsWuDfk3lvNo7FYr7NQzxTytUZCemmz8afLqm15LLvOe
 nkXDYcO8qhXsiNXcPnQ==
X-Proofpoint-ORIG-GUID: ZgfN5nj_WpkIUtJT7JPJtPVTUI2QyuXl
X-Proofpoint-GUID: ZgfN5nj_WpkIUtJT7JPJtPVTUI2QyuXl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310094

On Fri, Jul 31, 2026 at 01:07:13PM +0530, Vikash Garodia wrote:
> 
> On 7/31/2026 4:22 AM, Dmitry Baryshkov wrote:
> > On Thu, Jul 09, 2026 at 10:36:57PM +0300, Dmitry Baryshkov wrote:
> > > Bring back features supported by the Venus driver, but not supported by
> > > the Iris driver: VP8 (encoding, decoding), MPEG2 (decoding only) video
> > > support and also support for interlaced video streams.
> > 
> > Dear maintainers,
> > 
> > This has been sent three weeks ago. Zero reviews. This is hard to name
> > as an acceptable response rate.
> > 
> 
> Acknowledging the delay in review in this series, and my sincere apologies
> as this had to wait.
> 
> I did not see any sashiko reviews in this. Is this all clean OR the series
> was posted before sashiko was enabled for media patches ? Incase later,
> might be a good idea to respin it to get the feedback while manual reviews
> gets in.

What is _Your_ review? AI tools are a help for the maintainers.

-- 
With best wishes
Dmitry
