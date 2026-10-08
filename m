Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D8348FF6B
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 10:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791454793; cv=none; b=cwTJAUl9x65yb1rgjAdcDzHFznn5Bz45XM5mkeIbJqdYibvy+BvNU8d1k4p8TsajQRKYQ9spvGzAuQcuFWRHJimlmBbF15K1jCK643DivoslPA1hvYniKfY5aIS4IgP4KSnI48ujsaUvJoerxgAPdL8oWvl/HTO8Ei4ig+RQgvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791454793; c=relaxed/simple;
	bh=CAns1kpFjOkEwlWcDBtHA3yVnCbAIQ5/xcA8/HqZHwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nWPB9Pn5cWPF15Da8cAy0H2M9oP9NRuxFJBX1gmAQBVdf6wMeOSXAUjVDmlwvUgsiU7F+FQNl1sTQr35LAX4zVuDamkMvkWRP9Wol1m+qX4hXI/RnimcISo57nJnQbWHjCrApebHSm2YfDasRr3Vl1T2WAS52gcFWNZvrPBi864=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gBMvNK/h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jf432L/O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gBMvNK/h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jf432L/O"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KO412167094
	for <linux-media@vger.kernel.org>; Thu, 8 Oct 2026 10:19:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ACvcEoQJ6yJD60WoilnoxcQP
	rTS0t8WYc/nNd0My3BQ=; b=gBMvNK/htK7yHoaukObZRPuXfHu1rvy73yUVbzox
	wD1k2ZGjrIbjOSdwFodPzQZTpGjgFMygcqVXp0ElhKi6MdPf9xkmIha1Z94wGCOr
	+IO/g8uPypsqhrfp9odVIWZiIGOTFXrptAE/EbCgFPiSQQX7VFdB4I1dkC3/KWwQ
	TJ7TxR6x/0sFgZOV6zlWQOrsKe3T1J2RS4Z+pzEYsj9/y7fTvUXckXa8vqEd/HxT
	BfJ1EanPUrs2GawlI9O6I3HYVjl5duQP/ehsepraeuVX5unmtYdhM6YIneCIuMYW
	uofYk18yJuk2jgu53BbqAld8JLQqrwqhYHNPMT501wkoOw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2thhc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 10:19:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936aa34873bso1010321585a.3
        for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 03:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791454790; x=1792059590; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ACvcEoQJ6yJD60WoilnoxcQPrTS0t8WYc/nNd0My3BQ=;
        b=jf432L/ODreoXaSGXPwLvwaEGI6i5TqImBcGTNGWbBchpHm/VNJHW0El7P4QRRs6cc
         abYBy3fLNmG9zKE1vBNHBu6dXz/b/Dcm5uBwnwNmt7JxDhO+j3teOSCFKxWLDn0qm9jy
         8Q/whyux2QayZafEw6HUwgYGUtIOV6FV1/Eq7KBmX5LnBNgtfGiqGNxzddWeBeDy4QJO
         DdylFAUmmas+aKxOr703iVEMbb0uBzV33k4PGdAZK0ViJS+r3FAVWL5P+GGG68B0scVV
         VkioudoVQbBKzmpSWEY0EPRdTdJ4EiI08DNZNoHn1naYawyPdPoa4YadkryCaQtVw2us
         7HAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791454790; x=1792059590;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ACvcEoQJ6yJD60WoilnoxcQPrTS0t8WYc/nNd0My3BQ=;
        b=EfMp4EGyYY4Yf9I4A90H3RlHJ0CV25zbMJ9MPahwq25pum3qdj5T4v4S75oAu0wQZJ
         Y2Nj/2KWoOVthj42yG2BRrM1KWPOkwaFebsrLD3meuJ80+bZnZ5IgaH+84VpUwMpVcAx
         3Bb2dK9PTnuYBbqoc9NnA4KlD4wPCBg4k4BpsFcHONgoLsn7w8Lp9DlM8/ACjrzrvtPI
         w7r24zmn+7huwXR6vVJJiqAwkXU2rgeI3H3v1b8E+5OS8DSwom9OY5gRagP8BlTixoip
         BK8e64vi0TmBij3+Il/x5MYsXOG7VFAa1r+UMPL6vPaQbzk7zPmhaNbL0GDc7qcp080P
         xpjw==
X-Forwarded-Encrypted: i=1; AKwUvBzYWXQjn5MoRN6jUZVFuloXLelWS7uDN1LyuftZko5+66iElQuXJ01mRuidOrSqrk+DNCsfpDo2V0GC9A==@vger.kernel.org
X-Gm-Message-State: AFuF++m1r3dGeCeWOgkqsvPH7kDhAb52ixREwrvDDu65WUvNpNnVLibz
	PqP6SQ3cbJdIrJQAtEJbv0wMPqHA6JSKGA9V2T02OLfTsfH+ed9YbDbXaNXNP5iGlIzRHJe0Z/e
	5jUzhnbDRecU/IapPDcNU5jdJ9PaKe5F36AVHKT8BVTxgeV9tN1KIBVne7Rv3J9Remw==
X-Gm-Gg: AYBFou395mafdxPKgArE0XhBLgbkgcHMIQA0aWxufz1wTX9WhM+FN6hfxBYo+iFtHid
	olcakTeJlY+ySSeDWhcKiZxBijG094bjTJZ6z8hbhCsR7EZRduCo/oQb7Xh3aTYPS7b/ASg/33M
	IjVwAg02l60RMkHoqVPka/3iUXwJmvgc5RBb7w5AySOw4D4SMaMvsTXm+XGTRRGtdkF99XJQsyC
	ygiu3tP+wKWEZoAUAcYLmrDc+4KL42Xg0OODIoWbUuk++utiF6Hq3iVGzvk87vGVX1vJF/52Y1o
	4GUdVJVH+QysdGMRH/UdFwypP3V28wK80aSRZ6u4Q7YThMofBwlcvz2Xg748D8vOMlS37YuqR2G
	hko1/6XS5CrO0tmCZGJm/peuXwtXCvpYCYoGQZ8zf7r9fDBvn9hKgBeOPwxcLNcEtSsaEgu2WQF
	V9itDRHbB6jRMN
X-Received: by 2002:a05:620a:44c9:b0:93a:2e8:5aff with SMTP id af79cd13be357-93e9b74c6bdmr953732085a.21.1791454789700;
        Thu, 08 Oct 2026 03:19:49 -0700 (PDT)
X-Received: by 2002:a05:620a:44c9:b0:93a:2e8:5aff with SMTP id af79cd13be357-93e9b74c6bdmr953728185a.21.1791454789200;
        Thu, 08 Oct 2026 03:19:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcd3016019sm1080731e87.1.2026.10.08.03.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:19:48 -0700 (PDT)
Date: Thu, 8 Oct 2026 13:19:45 +0300
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
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v5 13/13] arm64: dts: qcom: sm8750: Add Iris context bank
 subnodes
Message-ID: <le25s2rr4r5oj6bqg3mmzkj2bnv5wxn4odghxcug72lrdwxych@fkhrakeltdto>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-13-0322ca5dc10c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-13-0322ca5dc10c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=AbMkjHXG c=1 sm=1 tr=0 ts=6ac76e46 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=G2U8quZLHxfXJRKprjwA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: P7RpUaAb7TUCfsOH6STm3PqDO7T0Ub-f
X-Proofpoint-ORIG-GUID: P7RpUaAb7TUCfsOH6STm3PqDO7T0Ub-f
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfXxlhGyky32cmx
 Uk3f/eTeCWEGKA/AfJYGpyc8aS/PFro4uOu2I7EqnF1AuMNd5KbBzxbuh3g2FD/DhVJE2J4Zh7J
 TEquxvt0svPNiqdvhCgOe3459/GTF5o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX/p6Y6a5Ajuw8
 Ex+GAgM/8c9Jqe/lddHqxLOSqTTb0tTwramEJG7x7/Z0hMr9X0Kc4hJss2cPCk/0Z/lRTPFN25U
 qgL/JGmqhR5WmOGU4VMLcuiGyZVgwZ9CLPx7WxqZgblffycbOMGow55xK8nVY5zBHeA9OjLcwJk
 6RTuHaHdQDVx6pMelJA4DTuVhphY1Y+R0TX+xuB/PI9i+iD0MEQLUtATMRG0lbyy74JTg0cbyAh
 N5RVGrmo192/DxwJ8Kx1Q5hCexhoD78mOfEo5tHboWYlboJWSzJNOHN5ShmYA03nmY7GYAtwuzb
 A/Oo20fWq5N3dtX35RIpOip5is09rCrHh18mnbSw6UFDxjaA8D9BFcYQzr6U70jp+kMvLwxI0ML
 DoY9PwoEFCrhNNjzAt6Z7LAa43RL+7yQoq2QgR6yAtheqaAHEnuAFwwy+oxoIy89Is/GESRhmbx
 TMKyQ3AY+JqdlpbIzCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080041

On Sat, Sep 26, 2026 at 12:04:12PM +0530, Vikash Garodia wrote:
> The VPU issues DMA through several SMMU streams, and the hardware does
> not give every stream the same addressable range. The non-pixel stream
> cannot address the low 600MB of IOVA space, while the pixel stream can
> address the full range:
>     +-----------------------------------------------------------+
>     | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>     | 0x25800000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
>     | pixel stream addressable range (0 - 3.5 GB)               |
>     | 0x00000000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
> A single "iommus" property on the video-codec node puts every stream in
> one IOMMU domain sharing one IOVA allocator, so nothing restricts a
> non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
> that boundary the hardware faults, which shows up as unhandled SMMU page
> faults and spontaneous reboots:
> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> 
> Given that the address range restriction is for specific VPU stream, it
> should be ideally be moved to that stream. To achieve the same, a subset
> of streams is now represented as subnodes, so that each can be
> associated with its respective addressable range. The design was discussed
> and agreed by mainatiners here
> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org
> 
> In the past, this limitation was addressed with an iommu-map approach,
> with the iris driver dynamically creating the devices. That approach
> was later concluded to be a hack to avoid having subnodes, and was NAKed
> by the iommu maintainers. It was discussed in detail here:
> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/
> 
> The video-codec node includes address-cells, size-cells and dma-ranges
> to declare 1:1 mapping for DMA translation to the parent.
> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
