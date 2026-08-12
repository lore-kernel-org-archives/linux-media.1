Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5102138F64E
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 16:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786551871; cv=none; b=EjZkiLf105r1+zU4UUR7H5Pp9w9e8/vj71YxNVQkCA9tCM1KvFgpMGrWaPS7gyM13uq+9II3198danmrE/RFeQhIbCAyMACdjfzmh73UoDP7CHnJDQdKvnbl2slGn2Qa36BmBE7bVQkES4zHHqmdr6yhUR/s/0D+COH7os6haDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786551871; c=relaxed/simple;
	bh=unwTqYQYgzSHKGyCWVO6r3sU8NMsl6kJASRGd2J/oCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kROh8Vx2gp7Rg/VZfJl1cEdR5bCzdmzd4JIWhHSFsO3MoslhahFkmYStv/rqYAuTo30Hm0oRDzSbDl6R7hTXrKr6GpgumIqI3cIN+AEkxyIUpslSJEphEdNEgX4V+7jghRCz3KclDGxIDqmsZFFe0OuCAn9fjXmFY/JHs+JAFLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SJV8guvD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GL40RPiZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SJV8guvD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GL40RPiZ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CDbmwp3971647
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 16:24:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ke7lHalcK073muebjVd4ubl5
	+retrbxJF5l3ymk2G9Y=; b=SJV8guvDGzne9oXpM9WfovHjPdWHXfziKHkNoo3Q
	e0TpAgL1IPg0HyK7dIKY+LXe2loCln/vfJqgTRmM1HfRhdeVBocodO1Mw3uJqt9h
	PCNZ5pzgC6+TqHbfP/bPoVp2Ko98Tl2mpFyL7kvUpEh61ocO0fmh1FSamS7QmKBR
	YPvFChft4TFHZ7FnHHDNWY+1LXeJhklsZkfa3dySs6BNI2446HsQz02HICvFnvbX
	1tyI2LTf+dmCDHTUPx052Hc8tW43nSfcyh0DfXJZzqO7Dd9I+FEyIEk0U1VSwWe9
	Oh2QPAaJmPMYdOgibsp7e+khYTySeU1NgCRfbX08aNPW7Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0jgrjsau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 16:24:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c26012cd0so11754241cf.0
        for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 09:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786551868; x=1787156668; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ke7lHalcK073muebjVd4ubl5+retrbxJF5l3ymk2G9Y=;
        b=GL40RPiZlvpBb4Yr8/qXEbI5WQHp62duR02H8VO8hiV5N2SsYKQ9VVnHz13L7mt75/
         3yGA1lV0ykY8yUB+8c/2BBoqFSb/RAIghX+srX4KYWCI34E4DlrGlZlQ03TkcnA8YXI8
         vuXO9HOnMXprEq8e4+BlxBb3sTvL76hlXktj8wnuDDx79ws/oueDOuc5D7yd660+DOMS
         d279em/mfnR9QAlBju3s1MIclDSBHeY2SwbYxRR54niAA0+fsKXbJjMCQ7a1hTzQ0Vv6
         I+/A0Su5FBq296Gx9kpHysAZS8IeNGI0lELZLaqsR0pk2HKEhQpcMAtINojrJkyTA+xX
         y2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786551868; x=1787156668;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ke7lHalcK073muebjVd4ubl5+retrbxJF5l3ymk2G9Y=;
        b=rzO06P+2rGo7C3lF4wB5lJNHnDu2ZxEjygT1p7PG7pr1uXdvGND3+Ki2Ksqg2gKzow
         g4gAZAI8bl9SGDEIvsq8w73/gkLVaYVPWRVzmWfxTIjglHJSgx834obYODiG9hud+WO5
         NSZpkrdb4hL0lD1PZmIvvmjZqEht2eiY4YjtdCNgplCstjs392E9fFlu9tqhFy1tEBQl
         LyMViWqug+yDrCcKmdmb2APo79gGOlUeV6UZtWYQGIQuiVmK1vRrIv4Reb9MyCfJ8Jsk
         TPX6L4dcXBWzRQmy1nNfvnrZVwgZtdzzVS1zPePblGjpFFEmXGwjz/zQAsNNjSAvDoeW
         mrQA==
X-Forwarded-Encrypted: i=1; AHgh+RooAsSu5qCyve7t7B4sviTGTMMks1d4gUajkditk7IA1FRZ1rR+B+LUFM0jIWEBYHl/w1mVMaQG5M2QSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyUB5g1hrFiXOWbWGcisodz2gRpkDFa0dJHZVE1qR8Ru2QOSA1
	e7osasULageLyo3ajRUSadCV8wYLYd/573PJRa7TC6f61b6EM+Tz0QA2o3Ha7MHjtGFkydnM8fw
	/qPE40TEbdw1IeUx/OnlgYAwJDd6lT4w8SHGrfaFAKmnv4Aw5imbkr6mDnB3Wf8+u1Q==
X-Gm-Gg: AR+sD13nRoDk+P8W/7Sl+pU7A6ej8JXH+DG7gpuZEm1NWAcAYbd0cXH/b0m0ecSVBer
	oxC5Zn47AE+8VrWQ2Mac3QPpzrZ26E84jvV4Uh3qsBzpDKkhc9cvgOzNFflxFPpea+26Tmhsygr
	Vo7btCk+7xdNDZpLSBZNxvmNiUIsR+3MydFlhaAMszmkuyeLv1GR3hHFpIDKjqKxTllOefzW80p
	zuCEBH1ufNzaSOrSOLVx2wyHVKbsVAugjC92WzMxQ3kYl8byhZpc/P+IpqtA91Pqq/2X19gET7B
	QLD9EGC8VoJoB5M/YRtffztk7p9BMMT6Pww1CkE4zA6PWFyCZKRXzdjRZILHQSGfyEjDJDo4ZZJ
	ENkWbKdwSjzmtdnKOaferuFQJ5nQ4JJ0iUCWcDG8Y5H+hJLkBU/pXvmlf29DNh2vt6hYIJnaoTQ
	/ecflT7boAnHQu
X-Received: by 2002:a05:622a:581a:b0:528:22:8c61 with SMTP id d75a77b69052e-52d648b2a9emr55622121cf.38.1786551868216;
        Wed, 12 Aug 2026 09:24:28 -0700 (PDT)
X-Received: by 2002:a05:622a:581a:b0:528:22:8c61 with SMTP id d75a77b69052e-52d648b2a9emr55621511cf.38.1786551867649;
        Wed, 12 Aug 2026 09:24:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a1082ae541sm6037261fa.19.2026.08.12.09.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 09:24:26 -0700 (PDT)
Date: Wed, 12 Aug 2026 19:24:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
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
Message-ID: <zrwepjscbusdpzarfiiz2rbtej5ggjay4yqiir4pdvfvzuu7ma@5e6wdi6sck34>
References: <MHRdGybtgutWtIo4EOZisrGdCVgOj7AdOArjfuxCXTTNcc1o1v40eltpkDUqZl5sOY9tjRFaY6tc_OKvzrYJ4w==@protonmail.internalid>
 <429d5d1d-92d5-4949-9991-b092cc7e9937@oss.qualcomm.com>
 <181b02e3-831e-4461-9327-ab5646380a10@kernel.org>
 <73b26356-8ccb-4a81-b626-a96de5b13173@oss.qualcomm.com>
 <v7vlh2lgvluvacmxora6l7u5r3cbhr4xaqqlzqdli5jympfwxl@5qsqc354n4u3>
 <g_hgO2Ky6WOywvRuvLUE7DXb-e7Kb8S3QoVsLbN3yhHbYzryQwZBT0VLRe3C4iVy8rUA9Tvc1Vu255IjAnbRJQ==@protonmail.internalid>
 <7caa7fd4-6732-4c80-8b8e-a0ed99631ba2@oss.qualcomm.com>
 <6906ca3c-03b2-4d9a-a3b6-2d38345d8534@kernel.org>
 <oeiqgw74eede7d3l42fgpplvk6lscpx4kjzj5iae6vrrgsxomi@wnl7cnon6rty>
 <6937899f-2fbf-4349-8c7b-1de53850a855@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6937899f-2fbf-4349-8c7b-1de53850a855@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEzMyBTYWx0ZWRfXya9n0i/OU8Et
 ev/8DQ58UVv0HPMJDuVYWhOQs2IbHBRMPGbqoYUq8tYSy3WUBNo6wqO+GlUuX7N7UpJDZWzVFnM
 H0XQ+vDp5RlM97NZY92His71b1USHXVi1+oqfP2tGjXcs+r+7Oy6plw8VRFe9Qq25mlM+3IWCqJ
 K8ZqToN2hwEWVA0rdwQJCDXv1sxXDozmpziBZNN5FcE4qCERP12hp0f4ZDPEK2P2YXg96whE8fC
 4t1Y23yIadUa47pzdeGqJ8ziWf7Z6WjZM0XCVHwIdD9slA2pIy8Ub5SP08Ru7PB5CLeF+py8Pdo
 wg3WCEi6/hE9bq01YMmdaOK5XI4Q/zOzNIiHHwegKTpAlPGRjHPjTPiRUtxBNznl5gpE2v3VQSL
 xBjg4aoPt9R/XZffh7THTo2WvVCqNHFerC73IzG5O63cQEKF1Io10fmXizU+GT6niNgUi/vqeuL
 zUdlXmJgQ7Fz97lGHXQ==
X-Proofpoint-ORIG-GUID: iTLGiPU1vziVik_VPAuu2_y_Aq4GzteB
X-Authority-Analysis: v=2.4 cv=TNJ1jVla c=1 sm=1 tr=0 ts=6a7c9e3c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=FHuHVHg59RjkpTgw9HoA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: iTLGiPU1vziVik_VPAuu2_y_Aq4GzteB
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEzMyBTYWx0ZWRfX+hNG5TCNl71w
 exrk+7GkThNCqkuqgZJLOvCslS+PLtfM/EQU64qjCeEq93F68Zdqd4xzgC/w1XGYZW8JzpWP/zB
 oqoSnEEyYtSgZ3ep3xZLgCn3YOh5apE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120133

On Wed, Aug 12, 2026 at 09:15:48PM +0530, Vikash Garodia wrote:
> 
> 
> On 8/12/2026 6:16 PM, Dmitry Baryshkov wrote:
> > On Wed, Aug 12, 2026 at 06:02:58AM +0100, Bryan O'Donoghue wrote:
> > > On 10/08/2026 17:57, Vikash Garodia wrote:
> > > > 
> > > > 
> > > > On 8/10/2026 5:40 PM, Dmitry Baryshkov wrote:
> > > > > On Sat, Aug 08, 2026 at 09:18:42PM +0530, Vikash Garodia wrote:
> > > > > > 
> > > > > > 
> > > > > > On 8/7/2026 6:48 PM, Bryan O'Donoghue wrote:
> > > > > > > On 07/08/2026 11:22, Vikash Garodia wrote:
> > > > > > > > > > > I don't like the idea of this series, because it_again_
> > > > > > > > > > > doesn't tell us
> > > > > > > > > > > the truth about the hardware. This typicall ends up with
> > > > > > > > > > > bigger problems
> > > > > > > > > > honestly...thats all the info i have about the vpu hardware that it
> > > > > > > > > > restricts non pixel to DMA from the 0-600MB range. The same i have been
> > > > > > > > > > trying for a year now
> > > > > > > > > You are not honest here. You also know that there are secure streams,
> > > > > > > > > which have to use their own IOMMU SIDs. And some of them, as far as I
> > > > > > > > > remember, also have memory range restrictions.
> > > > > > > > please read the commit description again, the answer is there.
> > > > > > > 
> > > > > > > So I don't necessarily get all of the detail out of the commit log myself.
> > > > > > > 
> > > > > > > Could you give some detail to address Dmitry's point.
> > > > > > > 
> > > > > > > The question as I read it is - are all of the other potential SIDs
> > > > > > > covered by this change ?
> > > > > > > 
> > > > > > 
> > > > > > I get the query as "secure streams also have their dedicated reserve
> > > > > > regions, so how does this approach helps" - This patch does not reserve any
> > > > > > IOVA for secure streams, only the forward looking subnode can assign
> > > > > > specific reserve for specific streams.
> > > > > > The patch enforces a common IOVA across all streams, and is good enough to
> > > > > > fix the problem we have w.r.t device reset.
> > > > > 
> > > > > No, it's not good enough. It defines that both non-secure streams use
> > > > > the provided memory range, it doesn't provide a natural way to later
> > > > > _expand_ it to support secure subnodes, etc.
> > > > > 
> > > > > We know that there is a problem. We already have been bitten by not
> > > > > describing the hardware as is and using band-aids. Can we now learn the
> > > > > lesson and write a proper hardware description?
> > > > > 
> > > > > > 
> > > > > > > > > So, if we land these patches, how do extend it later to account for all
> > > > > > > > > of that?
> > > > > > > > > 
> > > > > > > > forward looking design would be subnode, which we can land ontop of this
> > > > > > > > series.
> > > > > > > 
> > > > > > > Yes it should be possible to branch to make subnodes work on-top of this
> > > > > > > - accepting that once this lands it becomes ABI and support for this
> > > > > > > method must be sustained, even after sub-nodes land.
> > > > > > > 
> > > > > > 
> > > > > > Thats the plan. This goes as ABI with subnode to land on top of it.
> > > > > 
> > > > > So, do you actually plan to support both ABIs? This would also mean
> > > > > moving reserved regions to the subnode.
> > > > 
> > > > How is that different from moving the reserve region when stream IDs
> > > > would also need to move, so be it for the associated memory regions.
> > > > 
> > > > > What prevents us from landing subnodes straight away?
> > > > > 
> > > > 
> > > > You are well aware of them, but still asking the same. Reasons,
> > > > 1. We have been attempting the subnodes for almost a year with multiple
> > > > pushbacks from multiple maintainers. We are closer and working on it to
> > > > post for iris, followed by venus, once review is acceptable for iris.
> > > > 2. Current solution, in this series, is much easy to apply for all
> > > > kernels and can land faster so that it can fix the reset issue we have
> > > > for already enabled devices.
> > > > 
> > > > Both from timewise and simplicity wise, this proposal is made to address
> > > > the reset issue, while subnode can land ontop of this, without breaking ABI.
> > > > 
> > > > Regards,
> > > > Vikash
> > > > 
> > > 
> > > There is another solution.
> > > 
> > > Restrict multiple concurrent streams in both drivers. The failure mode is as
> > > I understand it only triggered by _concurrent_ streams so, restrict that
> > > case in the .c code.
> > 
> > I think this might be the best hot fix for now. Very local, very
> 
> No, it's not. Restricting concurrency does not avoid the reset, it just
> reduces the possibility of occurrence.

Ack. 

> > presice, touching the driver pieces, letting it to continue to exist
> > even after the subnodes have landed to support the legacy case.

-- 
With best wishes
Dmitry
