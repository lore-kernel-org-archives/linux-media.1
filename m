Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3734302FA
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 12:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786538777; cv=none; b=ERIK7HEfRrPUzbCSYtqgMDM+I/AydCDkYe5X+5rxWRlZTcQeXTPZNj6rp90ykGf+hxIZZv73AAIJwRpYOnkwPmBiI2umKioKms+GM5SyDMkm7qVj63UuwCK415xBhw0WzdmuHjuI0fOX/RK0kOEE6ccagextXwRTY7s5FZ35J2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786538777; c=relaxed/simple;
	bh=E21HrPIMmupfA9fkmEBQjke1COEABmPd5LbFfsXlw8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RSvWXEEa2AQ9cIeQrJLRZoTRAHjXe/aNfg84VXjlXKTvgXGpxNJkOuiiQXBcrRT95CFKMZG7nAs8HKij5VJroULMVLUQ4IEvu+UZDvpx4C8lRFfBZftjPHod3XANYKYcwNLN+uAYbE0ZDkkrHEhinRUM09sfQNAh57oUPMPEctg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OJS7tbal; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c7BV5cI+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OJS7tbal";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c7BV5cI+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CB4QDm3311349
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 12:46:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RsWcoejxXn9pzsu78SYqkef5
	s5cNXJjqJt2DfYmpRMk=; b=OJS7tbalbspCDeHj5pLtNAwqh0q8ytK6Ey+yBVvM
	qHdh68YI0htk4OMnjF9gzoELNLi6xG/mryZLK2tBPEL5cNklKYIcjK5XwL6puWu6
	NDvzilGlIyUgOF0159bjlsVGQ41KqW6a/2M3d5E/yuuxW5bRJpNK40cIf8WcV4m+
	/iFRZ/+otOQY440jVSArLp54RsdzMByUShbE6/IUrG7knCGJ/mDsaVXui7A1Bikn
	z2fvKuD3xLVbzzRA36GHzelOtPuH+SKppCFussVHpsEZtJzzOOnFWHz49k3eEHDq
	7l1/LD3czKQSwFxqcrSJF11+ejT/0Y12Oya2f1FKSbNfGg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0p3d0qw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 12:46:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d137a68so19194001cf.3
        for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 05:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786538770; x=1787143570; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RsWcoejxXn9pzsu78SYqkef5s5cNXJjqJt2DfYmpRMk=;
        b=c7BV5cI+fdoBmm8Dj0rGgvNkiUFp77pYst3F7hxdj49V+eNfQ1I+3vmE1fYctVNolT
         y4jom2B7UD80JTtCz0WmqYvfY+fGhHPwFc05vdttzZySOIZhDwrIBY/nAEGvhKxrPclK
         v5kEJ+24kXivw2murp364MbxWkWhUNLnFaRzfvWfTCjyFaBm1BfIRvdrXyLdyAWgm6uQ
         GlcoYELUvxhm+NggRyKuteh2ZEMVAGG03leF22FAOG8iJr7opoObGZLMrEU0kdtmkp7u
         L33EwhjEDzddI/DWLsO9F+mcyNKscRO5iZ1Y+MgehdpqXGGcb94Dz2nWIVBxNaTFx9Sx
         jIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786538770; x=1787143570;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RsWcoejxXn9pzsu78SYqkef5s5cNXJjqJt2DfYmpRMk=;
        b=TWrjCqROzzX6llh05Ea45ZudOB1KTx6UDN/Cr9HuxSViHVa44JQQLg1cOIb3WR32R2
         sUrooYC9bxBxjWlHVRSGbuWrB+eIOMbQyMD9ZDZr9KlQpvPxmAzlIKRUkl6dRjqOOlFi
         8ZmNp8gd25d2/U9Z/9aPJdu7amwpOeVIzNr3rCh4iBOYmtLzOHL+9rNl2+cLMgIILlZa
         kWchtAuWeE57eNIPmWjnKBNZHbTbU08S7EwT+VqZGgD5uX6ZY9Q1/4wgESItH4TikGMA
         nna+2UhCe+CmvNcg1wi1DpUft+SN4Ynx9o4VFOAXFn6cziJQ748rnGRE+GUyyydC2DO1
         lFOg==
X-Forwarded-Encrypted: i=1; AHgh+Rpx3zFLJ4erQV/wcG4lFMEsPJEyRtNuO6SGDkic+pjgRgiyBR2B1nts6O2Cz9c9/kfW6G6jlv2kJIC1lA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg3JpzjL+VhmMoEu1uHBqLv2zq1OUodytA+tKXuR1veHNIrA3c
	dDKnrSQT/dsDWjz6znnqawS15g5LNstkZgbys92/PGyMJf3q+J9Law+oYNkiJ3Hp8oVWw5DaO+A
	LY25D7wIJfUjqzQZwSZOfePL6JLykNpSCM3u5pjRCSgVYKn9+EY9jWDPW1jwYsH88KQ==
X-Gm-Gg: AR+sD130sAVwccqGzygH+47tTULd649H5Tbj+kogNFo9tQqqD8mEbH8pFt1jGzoVdbS
	0NwuSvUJw/sFzdInXcEGpJtykZ6oZYp6G574lKM6Fp2FNJCF9aeZlykw1YEviE9v31EgSsPQC7G
	8SwqfycjHBNDHTt9+g0YNj7v/lFNhDjwQ4Qnp4rojwrXsnNiJDPsk5B1kZDoAJeKZ6BAHiSltlP
	ThX2gUZlq6VWjG8okQzVtmK1QvQSpaGhI8oFfyKVKfZ55UGJX7XKHlIqelOR+jRtvTvBVHpCxUm
	GMaL+rld3loXOC07NqmazJ5vmpw0oRErUem9zR7p3SuV2AkY0zAz4DSFs28EaZ0g5jb3w+RzBC5
	JwX/05ydSNBmazrKwHYXppgufo+Af/rwb1y/oks1lxodJ4uiuH5sCKkWg477XjO/x4AahiVPgtk
	E0RDtQNNexEsvR
X-Received: by 2002:a05:622a:2589:b0:528:3ae6:14d6 with SMTP id d75a77b69052e-52d648429bbmr37300841cf.36.1786538770117;
        Wed, 12 Aug 2026 05:46:10 -0700 (PDT)
X-Received: by 2002:a05:622a:2589:b0:528:3ae6:14d6 with SMTP id d75a77b69052e-52d648429bbmr37299941cf.36.1786538769623;
        Wed, 12 Aug 2026 05:46:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b44d0478d1sm479316e87.72.2026.08.12.05.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 05:46:08 -0700 (PDT)
Date: Wed, 12 Aug 2026 15:46:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        cros-qcom-dts-watchers@chromium.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Aniket Masule <amasule@codeaurora.org>,
        Malathi Gottam <quic_mgottam@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>, stable@vger.kernel.org
Subject: Re: [PATCH 04/22] arm64: dts: qcom: hamoa: Reserve low IOVA range
 for Iris
Message-ID: <oeiqgw74eede7d3l42fgpplvk6lscpx4kjzj5iae6vrrgsxomi@wnl7cnon6rty>
References: <27f0b033-e940-4369-aaa0-f08426aac73f@oss.qualcomm.com>
 <tdgbfewnlj3xypfnyckivnd2b6667laapkcfs2vpnk74bh22aa@obasatns3jfr>
 <MHRdGybtgutWtIo4EOZisrGdCVgOj7AdOArjfuxCXTTNcc1o1v40eltpkDUqZl5sOY9tjRFaY6tc_OKvzrYJ4w==@protonmail.internalid>
 <429d5d1d-92d5-4949-9991-b092cc7e9937@oss.qualcomm.com>
 <181b02e3-831e-4461-9327-ab5646380a10@kernel.org>
 <73b26356-8ccb-4a81-b626-a96de5b13173@oss.qualcomm.com>
 <v7vlh2lgvluvacmxora6l7u5r3cbhr4xaqqlzqdli5jympfwxl@5qsqc354n4u3>
 <g_hgO2Ky6WOywvRuvLUE7DXb-e7Kb8S3QoVsLbN3yhHbYzryQwZBT0VLRe3C4iVy8rUA9Tvc1Vu255IjAnbRJQ==@protonmail.internalid>
 <7caa7fd4-6732-4c80-8b8e-a0ed99631ba2@oss.qualcomm.com>
 <6906ca3c-03b2-4d9a-a3b6-2d38345d8534@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6906ca3c-03b2-4d9a-a3b6-2d38345d8534@kernel.org>
X-Proofpoint-ORIG-GUID: 60EeWJ4ZM-5b0ryzLbYwq8m7lnH8RJk-
X-Proofpoint-GUID: 60EeWJ4ZM-5b0ryzLbYwq8m7lnH8RJk-
X-Authority-Analysis: v=2.4 cv=UfNhjqSN c=1 sm=1 tr=0 ts=6a7c6b12 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=gl3J5UnCWOw9tU21VO0A:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEwMyBTYWx0ZWRfXzV5PP+CXbT9n
 en/6zj0ko/EjgUGzLhEXUNGDLaorSMrDGwWmqasEjpD8Izc05cifM2+wXWfljQnWqnbPQm1ccJA
 Tb+odlKcGTlrK5tJbJRuu9TO+hXOTor6mfrvm42F69u5IwQ6Y6nkI7sCQoGqgwbpRS2h8VEdHGf
 g07RqcuZQ6lkxjScFEv+nOAT14ChZ2bLZ9bZr+JE9IJ6OKVGOnI6jf2UtWuSjvEgNOzoK+GU4O+
 pqlscF0cp7KUNe9u4FIsIei8BYYwV39Voenv+GqNIetkZ3IDB9rqGX0/feaYU55Al4JDSwxw6Q4
 7B7P7GuwAv/PeJAdkne5uDFmNvp+C7kTVWfs3CQXos5K+5osuk6rXNVLbFO4dBoiPRYEcAp12yl
 8Au59vFmCwNqBdIcb9tvtCBcTJZvOIEMXOUpDlYYot6bbeVGY9fPoVANN7Iy23mO/GnAZdldNFX
 mWRns4b0q9ouZ9viOdQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEwMyBTYWx0ZWRfX8r049Zt97oqb
 4yOT99A8RN568lQM5hFTB31VvCLCZAzbzISlQvVqV8U3Jl9hSJBo9xNq6f87JmAq+fyY1zZ11mz
 HXHD7XP8PWsAxTJoITxynZWu54UE/wg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120103

On Wed, Aug 12, 2026 at 06:02:58AM +0100, Bryan O'Donoghue wrote:
> On 10/08/2026 17:57, Vikash Garodia wrote:
> > 
> > 
> > On 8/10/2026 5:40 PM, Dmitry Baryshkov wrote:
> > > On Sat, Aug 08, 2026 at 09:18:42PM +0530, Vikash Garodia wrote:
> > > > 
> > > > 
> > > > On 8/7/2026 6:48 PM, Bryan O'Donoghue wrote:
> > > > > On 07/08/2026 11:22, Vikash Garodia wrote:
> > > > > > > > > I don't like the idea of this series, because it_again_
> > > > > > > > > doesn't tell us
> > > > > > > > > the truth about the hardware. This typicall ends up with
> > > > > > > > > bigger problems
> > > > > > > > honestly...thats all the info i have about the vpu hardware that it
> > > > > > > > restricts non pixel to DMA from the 0-600MB range. The same i have been
> > > > > > > > trying for a year now
> > > > > > > You are not honest here. You also know that there are secure streams,
> > > > > > > which have to use their own IOMMU SIDs. And some of them, as far as I
> > > > > > > remember, also have memory range restrictions.
> > > > > > please read the commit description again, the answer is there.
> > > > > 
> > > > > So I don't necessarily get all of the detail out of the commit log myself.
> > > > > 
> > > > > Could you give some detail to address Dmitry's point.
> > > > > 
> > > > > The question as I read it is - are all of the other potential SIDs
> > > > > covered by this change ?
> > > > > 
> > > > 
> > > > I get the query as "secure streams also have their dedicated reserve
> > > > regions, so how does this approach helps" - This patch does not reserve any
> > > > IOVA for secure streams, only the forward looking subnode can assign
> > > > specific reserve for specific streams.
> > > > The patch enforces a common IOVA across all streams, and is good enough to
> > > > fix the problem we have w.r.t device reset.
> > > 
> > > No, it's not good enough. It defines that both non-secure streams use
> > > the provided memory range, it doesn't provide a natural way to later
> > > _expand_ it to support secure subnodes, etc.
> > > 
> > > We know that there is a problem. We already have been bitten by not
> > > describing the hardware as is and using band-aids. Can we now learn the
> > > lesson and write a proper hardware description?
> > > 
> > > > 
> > > > > > > So, if we land these patches, how do extend it later to account for all
> > > > > > > of that?
> > > > > > > 
> > > > > > forward looking design would be subnode, which we can land ontop of this
> > > > > > series.
> > > > > 
> > > > > Yes it should be possible to branch to make subnodes work on-top of this
> > > > > - accepting that once this lands it becomes ABI and support for this
> > > > > method must be sustained, even after sub-nodes land.
> > > > > 
> > > > 
> > > > Thats the plan. This goes as ABI with subnode to land on top of it.
> > > 
> > > So, do you actually plan to support both ABIs? This would also mean
> > > moving reserved regions to the subnode.
> > 
> > How is that different from moving the reserve region when stream IDs
> > would also need to move, so be it for the associated memory regions.
> > 
> > > What prevents us from landing subnodes straight away?
> > > 
> > 
> > You are well aware of them, but still asking the same. Reasons,
> > 1. We have been attempting the subnodes for almost a year with multiple
> > pushbacks from multiple maintainers. We are closer and working on it to
> > post for iris, followed by venus, once review is acceptable for iris.
> > 2. Current solution, in this series, is much easy to apply for all
> > kernels and can land faster so that it can fix the reset issue we have
> > for already enabled devices.
> > 
> > Both from timewise and simplicity wise, this proposal is made to address
> > the reset issue, while subnode can land ontop of this, without breaking ABI.
> > 
> > Regards,
> > Vikash
> > 
> 
> There is another solution.
> 
> Restrict multiple concurrent streams in both drivers. The failure mode is as
> I understand it only triggered by _concurrent_ streams so, restrict that
> case in the .c code.

I think this might be the best hot fix for now. Very local, very
presice, touching the driver pieces, letting it to continue to exist
even after the subnodes have landed to support the legacy case.

-- 
With best wishes
Dmitry
