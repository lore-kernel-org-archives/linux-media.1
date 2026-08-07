Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC343D3339
	for <linux-media@vger.kernel.org>; Fri,  7 Aug 2026 09:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786093439; cv=none; b=CHfL9rZEwRyrbfaNYb22dpSjuP59x9gbdEWiuMa78E/bKjgQeRMM+8xQitt7dCPElERrwKEdYxozYzHpD+DmN6IhaJ0w2rS4+mkzfGILLDziWF8Un9wXYQmVT9DPK1wsHr8O18QUAkaAT79aiux8tFt9VtXs7aiGcUhm4EXY3mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786093439; c=relaxed/simple;
	bh=6qpm1hYr5RkqGjInfrEiDCqKYgYPp4MbvxjnH7VHeMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tfMh8f8JYGbMxiTBIZlJDRU5o0z39YGdUSU0nlxzhZ7UliiCAyAQiIB8CNAtJPFq4smMabrVHg5p1Wg1Y4xMlha1zmcs0glWafTV3wekLVRE+kxkX3qDw67H7V7RAuFTwi3y13BEFNI0H7JlAvrlqEgEXjEHBUW0sxcBAgQwJYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VrebY/ox; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PcDsyxGK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VrebY/ox";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PcDsyxGK"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777mpOo3519247
	for <linux-media@vger.kernel.org>; Fri, 7 Aug 2026 09:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5Fd0jxP6Kyr1lTjklAhR9bTt
	VEDBHCTLrVECFH+tmXM=; b=VrebY/oxK1ULEBZmWR003ElIvBMt6M2Vr3K1Q/VX
	SPWfMmBODxOD62KjYFBzesL3ZAc2pmitjCrdwjxmHqHmZTW+Ay3/o4py3+uTmVAQ
	CVMHtR1Jr+Rgps/PUkAmjlnRyka9le33EQDvpNeVyWJJpsGDw8LqstTBzUqvMqVi
	wxYuIIOpMdDp+0yQUICv/fFaUG2PjSF3wuYeBhrGoKaOxV9pCx47j4MyBh1xrtiF
	7ZrEWxS4E/NxVNJTYDqrpi2XFPat2nrhmRJ2O7+7nI/HmBUxT0XQX8O7L2T75Kn8
	UCPlQnXZFxGpGCaNFBdmk5j1lNuxL82fQGzXxCAC8QHMhg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6s36th-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 07 Aug 2026 09:03:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c26012cd0so30338761cf.0
        for <linux-media@vger.kernel.org>; Fri, 07 Aug 2026 02:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786093435; x=1786698235; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Fd0jxP6Kyr1lTjklAhR9bTtVEDBHCTLrVECFH+tmXM=;
        b=PcDsyxGKGPHZqRq8S4OEjxDf6z6Pm4x7HvCDBbjKUFrfebCLSPb8+C71S+jINf/Os6
         KA+hI+bzL4BUJTH8bCLL9yWdlpFR6IIv07J28rHk3fhfFSE3mr2by4DqQdJjRQU8Xbfv
         v39vjuI93zleUDHFzLjp7IrC5Uvz7/5MANF/ZAHxYvKEeqDK6E+umYxisk8sU/dnwNaL
         c41a5tuTwzQUVJIn/NzDG9uenzq2cK5VewhPiDqmcMP/Ow8rWgYcGS0uy2KLWBKPcWS4
         YYwadkHRROneV0ZlwQOjDMLDGFlIgK+b5CmpFrf2JdkHHeLHkR48Z2apNRQFjxX1z1yT
         eL2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786093435; x=1786698235;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Fd0jxP6Kyr1lTjklAhR9bTtVEDBHCTLrVECFH+tmXM=;
        b=eC2ylTUfDG+l2HFudN8P8H29qhJGhMNe9KRVbUL3q+Qt/X865sLwzrC3bc6jW8VilZ
         p0u0H7sE2uLu6FqNusB7xVDnnEtsPghbJHoEHjssIWE4u6hmb8e5IRobl/4MO8sx5ee1
         nQoVe9t/zcOrM2L5sbxtWa6MBKYFun18Y8uda1DmSQAgdvfm4o6DRklkMLvhYxw99qhT
         KWZE/xV/D4BuR7svFN3N8GK9l0YHVO/dkbum2WEeqTnB8Nxw+rOf7NG3AYfe1rdrI2tv
         dxKziOVC9H7SA74Ou7Q9zy47SzuqmbEFcTsvTMvZYYEIXHe3N4H4mZyTePKeTeUCKtOp
         8hOQ==
X-Forwarded-Encrypted: i=1; AHgh+RpOBYk/f/juJ0kPj5J6/WLa3pB5j80ek3mvmbu9k7ruac7Nl5Kk8PMXCsc96W2NEyEeJx8GfYv6ue1bsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBYoBGUNZ7GhfYeBP+0Q/xteF9iFyTeKSG2HrU0eV26WMmlzgz
	fHvb8z5NRcfKGfPgVIg6JOAFjFI9ehf2tKud/mvNkTE+oEjTKmRwYITFjlQhFG2lS416yuOV4Sj
	6iu3KJXltLtU4ZXcd/0IFMoBnKDBfjDtDSqZShqWBYd2cvuuv9DXKs2BZZIfmDbSVwA==
X-Gm-Gg: AR+sD12gRCpwqRpbgl9Go3hbuY82B8PLX/n1ILiEJVc38HRcgF03EoHHGZKZY+8gaxB
	/8j9kwH+0ezd95HkGTBFYGqPMYDu1I/xaMEaJ1J0NmYUsSm2EF2zlR+2cw0DYvkuP+kGMk71ZH5
	uVJh+/qGo7iK2si4Cb1a9qMIVmVYf3dnptFRb+PvJPzQ+ftjtjumIhmGyId7J5xkCHvGnwQW3tc
	+Uue6M0/xP8RgBn/UIONuel3aB2u3jwqSvysBdE3s8YCHxxNu7ETeSMFVEQlcP+6wr0uw20VH4R
	HG7D1mZ3woiC1N/Up+2ni0y/Y6as0QqkC3gZ0gkpQk3UuhCDfMVZJcgpDLvvEHkmGoTr2NV0q3o
	KJtHKYDHmKEw9HRfNYruy4csF3zkES9oWTTkIJAnWproVk8YCN3MXiN5//8ZtiXrs7d5AwYg1SJ
	we5Wl6Ro8BFnoiZQ==
X-Received: by 2002:a05:622a:591:b0:51c:b900:5136 with SMTP id d75a77b69052e-52ce5e1bb5dmr213221601cf.0.1786093435371;
        Fri, 07 Aug 2026 02:03:55 -0700 (PDT)
X-Received: by 2002:a05:622a:591:b0:51c:b900:5136 with SMTP id d75a77b69052e-52ce5e1bb5dmr213221301cf.0.1786093434942;
        Fri, 07 Aug 2026 02:03:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3050cf492sm344135e87.18.2026.08.07.02.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 02:03:53 -0700 (PDT)
Date: Fri, 7 Aug 2026 12:03:50 +0300
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
Message-ID: <ruow4uus64krlpy2gvm3g2d6rq5kgmgxnlhstmecil3gw7lhkd@2golvucd473l>
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
 <20260807-iris_iova_600mb_fix-v1-4-3996f67e33f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807-iris_iova_600mb_fix-v1-4-3996f67e33f9@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2NyBTYWx0ZWRfX5nD0/Qbr9dtI
 D6vYJ56VdTSLindQ1NMAcA2ZDlkE0xWctJ42isA01oVLPNub/eivmN2fZBZ5XP5ejp/Tvkna/tv
 XV1rKZJu3nVF8jAqcL40lcCSJCIBAu8=
X-Proofpoint-ORIG-GUID: Vp_4CX_F5OlUZFCIM0bU-INXr3h-H3KS
X-Proofpoint-GUID: Vp_4CX_F5OlUZFCIM0bU-INXr3h-H3KS
X-Authority-Analysis: v=2.4 cv=B+eJFutM c=1 sm=1 tr=0 ts=6a759f7c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=NEAV23lmAAAA:8
 a=t9ty7G3lAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SZajUbaRgOUCVt53atAA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2NyBTYWx0ZWRfXwEnmCjCKg1gq
 9DLHPXSZSYOdl3c3+2JUlgDOnKZvD5xUUNkBfp8AD4fWchNKW6AZdplqS7Xb++2SOkrzqgPIPPV
 Nbqrz5lVVqAgqlHOJUwmB+65aZgq6eeFp+ow4YR+aAnSaDV/osIIfsfpEI7gEtt3uuIMNhvG0vF
 AXzaYIVkrduLrXJLYChZzn4GEJwpshmp/S7RwY7D/6IY1zUtBXGslcAyRhHJude7tRcnF5eFjV8
 Jzjkl6nwscOkUEP2pRz6XZX61DDmnUVc75fCZqs2JE4gDpH5/J7WfRmzlrhNRKojprTnfku+TJt
 nnxA7jiH65m1t03LO6veWlJFEtIiyOp2FlxZoRYutQjdmXMpH1IKqHHoKz0vUql45hmAdR00Gy2
 iPP4eRsxVUb7sN9TyWgyb/EfzvgAMQGnw8jDADJnqZKkOT+4rFn0CIzwpc5kO28kIlDK1SILSAP
 Ia61BInEcZeiSIi7ejQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070067

On Fri, Aug 07, 2026 at 01:54:48PM +0530, Vikash Garodia wrote:
> From: Daniel J Blueman <daniel@quora.org>
> 
> On X1-family hamoa platforms, the Iris VPU reserves IOVA addresses
> below 0x25800000 (600MB), primarily for secure non-pixel buffers. DMA
> into that range, from any other stream id would triggers unhandled SMMU
> page faults that cause spontaneous device reboots. This is readily
> reproduced with one or more browser tabs driving multiple concurrent
> video decode streams.
> 
> Add a reserved-memory IOVA reservation node covering [0, 0x25800000]
> and reference it from the Iris node so the IOMMU layer keeps DMA
> allocations above that boundary.
> 
> Link: https://github.com/qualcomm-linux/kernel-topics/issues/1157#issuecomment-4458933574
> Fixes: 9065340ac04d ("arm64: dts: qcom: x1e80100: Add IRIS video codec")
> Cc: stable@vger.kernel.org
> Signed-off-by: Daniel J Blueman <daniel@quora.org>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index 8a96ea1bdb9c4c409b2af997680d8c13fed0643e..87f424765d513c97b06303bceb75ca9f176d2ace 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -666,6 +666,17 @@ smem_mem: smem@ffe00000 {
>  			hwlocks = <&tcsr_mutex 3>;
>  			no-map;
>  		};
> +
> +		/*
> +		 * The Iris VPU reserves IOVA below 0x25800000 (600MB),
> +		 * primarily for non-pixel buffers using different Stream IDs.
> +		 * DMA into that range triggers unhandled SMMU faults and
> +		 * spontaneous reboots, so reserve it to keep IOMMU
> +		 * allocations above this boundary.
> +		 */
> +		iris_iova: iris-iova {
> +			iommu-addresses = <&iris 0x0 0x0 0x0 0x25800000>;
> +		};
>  	};
>  
>  	qup_opp_table_100mhz: opp-table-qup100mhz {
> @@ -5439,7 +5450,7 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>  			interconnect-names = "cpu-cfg",
>  					     "video-mem";
>  
> -			memory-region = <&video_mem>;
> +			memory-region = <&video_mem>, <&iris_iova>;

I don't like the idea of this series, because it _again_ doesn't tell us
the truth about the hardware. This typicall ends up with bigger problems
later on, when it starts to affect other bits and pieces.

I don't want to NAK it, but I'd strongly ask to reconsider it.

>  
>  			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
>  			reset-names = "bus";
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
