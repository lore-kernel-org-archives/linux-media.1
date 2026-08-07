Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0979144A41A
	for <linux-media@vger.kernel.org>; Fri,  7 Aug 2026 09:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786093311; cv=none; b=BiYqIuzJOfQgDhoFiJRCOyjcMEw6s3FqeOj7SKuMUhWW2hkaLzmBrMS2ENFZE23Nk5OXCO9FyulLt7bvJ151oJthZQuUV9Nk50CJdElM6Wd9hnJwjB6k1CdOyOqHFFBOhATVF+Xh99aBHohnZjZEFZsbbpCsRPF5477YUgqYvk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786093311; c=relaxed/simple;
	bh=T2iUroCXlHi4fsuFredMnF0BlejS7IOAmvSaP/SLWlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C8+s6iTLLSeJF6iqCApC2Ai4asKTC8KeHkLoG8uJJRE5m6/Fe6GlTj3bhuQC2X8omKf9pIRtK/57W7M3bTcqagEZ/ux0HSVVCZ+1DsFCzbN6wnppqIXjsWDmWGBj1XaYqgmGGM7KC9mSMQw3/eTA9wLd+6j9/4Ak1MSVMFxj+tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z1WX/Nqy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F8rPTcPc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z1WX/Nqy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F8rPTcPc"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777tTV7493024
	for <linux-media@vger.kernel.org>; Fri, 7 Aug 2026 09:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YED0O9yc/XP1k6tppCTUtPZg
	+CU7mFNMCOh1afWNMdM=; b=Z1WX/NqyPUNs9S5BzAdWymCxHW5lVFk03F4u+nnn
	l5l3bhyB3r6AY0rJUFB4Xv/FWuHjZ9cnpzagSe+7Rn4DrBibB3/YUlu9/p1A2nAK
	f/Xjv/761SbT10bgx6OOUwNfv8ny2P3ZN5VAyUejpIxZeprWFZAvbsgxwJZsVtZc
	4qDbH5slj17RgRPGVULbtZ6WdEIlq2fnaiNwBx6kc19+vglVFJz12q2p9JE7AsvB
	C1zHpI6NR9a4mjZIpF0Wrq4NxD7dGSFBmNBWC6c5DvryU2HgbCOiSPIBKR+D7auq
	d0y5svOQPc8ecZOfFNK8ptB8Zi8x1tPtrSE7Wv3YCpJVgg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6rb2wr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 07 Aug 2026 09:01:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51ebdfceddcso34086741cf.3
        for <linux-media@vger.kernel.org>; Fri, 07 Aug 2026 02:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786093306; x=1786698106; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YED0O9yc/XP1k6tppCTUtPZg+CU7mFNMCOh1afWNMdM=;
        b=F8rPTcPckuCKH4fwG4VnIQC96MN5P4qsNozS+d4XcTOG0ulCCyR+1u7+hwPOBmQXbv
         EVG9RGy3Ci2Oxm2OLielGD5T9N7HS74tSZvfqiEnFdpvzjKU+7PXBr6nlT+CeFChFOyg
         3rnRg6xuRg6ubjfrLUJXmLa/XShywcE2iShra45sRbKFIFyzBHJF7GebvEYX5fXQ7C9A
         fUGy/+3pJKrza2fKmj22TkHBfuCBbJH/VuFuRvfc6v0ajgZT1iSwGY2JQXQumiOaT6yT
         m58dXcZIYx6v+l1rg38UULo6FHmQDBv5dmhXysTI3bkX+JDI2OPLrKAdonYa6IDD+bcx
         e9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786093306; x=1786698106;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YED0O9yc/XP1k6tppCTUtPZg+CU7mFNMCOh1afWNMdM=;
        b=oEtM83Bda1zsKwP4jQQawL/7YOIHpL3NzaFA8pCx3zyzi0cDZsRizmNmRtv3B3LOLU
         YWP4w1Ri5HeOfORtgvuEpBILmsVrZIklEZUvIowA+qUvr0PfSCkzESC6YUcP//x6d00m
         DZFlcbPHb8MxObAywdOPYe6fo3rHjRJTea9S+jP0LEO20ULiLxbDyzY/nL8zHkpCnxLU
         eyv1guDZ1/YA5SNTFxDipaotFrkzR0a5IHpiNkHXgdPyuGJALCDqgRz1Mb/eQp01J9Qk
         TuPIMhNEpL2kda1SSSShHkmK7a3UdEWV/SwLGisejj/rRbRkNwJZxmxCF7cMu1SqOXWI
         QOlQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp/zXtPoC8IhjaQYmg9M/oXO6V9W9KVYGXgnhZhTtXRfrTxDAcBK0DrlPvtf8d/9Hh2/KjKZOmUiWMCnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaRQdAY4E9G0xNppaQ3N2hA9k3ASrg4aqXPnn4P0ERP0xbHM41
	9HTLPg/WbU1t8y/XA9E/L7ryOhiYqCy6cQQcpJlgQWFjlx5tkHyP9MjsSXr1L9bFy3JihMg2tkj
	eDH6VTkkwHAIDxldI7ykpvQ2hjpWy8eZS9gXtg+UBN758skfG6bJtXDTpVe7gaMnWeA==
X-Gm-Gg: AR+sD10HRfMwN3Qp3XSr9mbA1qeFQBL3ErklqlrDNUcLfa0AzkgevrVB20Qn8PjBAQr
	br+Mtx2oh3oLezwPWSeJglKLM5j91cdVEDxX9+UQQfpU9k37O0iy97zuYB7jLNPJSTID9rogS/l
	q11Yw4kepnQUazCuLXRcWenga58MmvBzeFkd620nM2+ga1ke+DkOGcC0xNdJ8KPhZdyhXbIOVVs
	mQ9gzhzXaIaY1/wZ7cIY34ehj0mCvkGUV7Jt32FxMJ80j/Z0arkD/ygGvWvL3YnHJxsCtwjKYna
	aoXsT3GTLuuLRTKAvcBrLY+RL95Ej7YcmNDmw5W9OUasv/El1zXsSCEpdnrBnXlZcx9gUGMpYT3
	+vBIHp6xnYlXUneFEPG5Kxu7u920kiU8rENdPd1oLqYaxx0VvBK5KVYdSkTVeJQSQmtNyAQwvE/
	WxC0lTzc2Mupdomw==
X-Received: by 2002:a05:622a:60c:b0:51a:896c:9ab0 with SMTP id d75a77b69052e-52ce5fd70c0mr216393961cf.10.1786093305671;
        Fri, 07 Aug 2026 02:01:45 -0700 (PDT)
X-Received: by 2002:a05:622a:60c:b0:51a:896c:9ab0 with SMTP id d75a77b69052e-52ce5fd70c0mr216393441cf.10.1786093305168;
        Fri, 07 Aug 2026 02:01:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fdda80e00sm2320681fa.9.2026.08.07.02.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 02:01:43 -0700 (PDT)
Date: Fri, 7 Aug 2026 12:01:41 +0300
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
Subject: Re: [PATCH 02/22] dt-bindings: media: qcom,sm8550-iris: Allow IOVA
 reservation memory-region
Message-ID: <ghcgm37edokrrf2dvy5jbajlszcndaomt5h7fvbdbm55qrguqg@npf2vriye3j4>
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
 <20260807-iris_iova_600mb_fix-v1-2-3996f67e33f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807-iris_iova_600mb_fix-v1-2-3996f67e33f9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2NyBTYWx0ZWRfXwveKdm8FMKRG
 naPh0De6TWMjGVpN4h/yxaGvs263GjBl3QqdM1zgu/MTDZyJnj8x8ey3JU7hNMLtPx+9ZIjBgtM
 2wIcRR42zyN/bG7j28IoxvZ5WngAGDb2vEctO6p6PW4LPuz0U+hAJPPhocwJcs7hAf7s2hSSKJQ
 LX4uoTabLRvkTzZ/yoml0hDaQz63v35ydIkOTWgGkel2Ztm9EfD9g4zEID2u6ZavHMT9gHl0StU
 LZIN01cqpHlV5hpqbUzqeqfhm4Oi+xBrstGcjmJrttDDuRvXFSnm1YPqGlCg2qgDcIlpt/763Sa
 bYs7FQzOwyG554dSBk1RdE4rt42heng6vCEsiZpUYIYj8eoIgNXgprnlBEYSnMeJmQvJjMMQjxQ
 2867c3tOU3eAgs5TUuN9S98fvgTfm5WpkKkxUTWoFkS8JYXS5t6J8RodS40ftME3BgvrcqHEBo8
 rsjomEWEzbFtqmGotoA==
X-Authority-Analysis: v=2.4 cv=HPXz0Itv c=1 sm=1 tr=0 ts=6a759efa cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=t9ty7G3lAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0XZovuSqt_3v8KxE6RoA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-ORIG-GUID: 3eIPuNtBdiZkA4gvwQZ_Vbs2oUKAWoU1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2NyBTYWx0ZWRfXxb7L+0ltsZtS
 01et5GQaizMNlNbBDwG07JRwkr7yR3GLRmwSRbNk+KrItzvmPgexwLgKXMOx7BbFvCNq6gOAJvg
 9RxwkqRX4l84UOTG7UuJVhz2dc4rZ54=
X-Proofpoint-GUID: 3eIPuNtBdiZkA4gvwQZ_Vbs2oUKAWoU1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070067

On Fri, Aug 07, 2026 at 01:54:46PM +0530, Vikash Garodia wrote:
> From: Daniel J Blueman <daniel@quora.org>
> 
> Non-pixel stream IDs should not allocate IOVA space from the 0 to 600MB
> restricted region, as this region is reserved exclusively for secure
> non-pixel.
> 
> In addition to the firmware-loaded codec carveout, Iris platforms need
> to declare an IOMMU IOVA reservation (a reserved-memory node with
> iommu-addresses) to keep DMA away from restricted IOVA range.
> 
> Permit a second memory-region phandle for this purpose, and describe
> the meaning of each entry so the ordering is unambiguous.
> 
> Fixes: 9065340ac04d ("arm64: dts: qcom: x1e80100: Add IRIS video codec")
> Cc: stable@vger.kernel.org
> Signed-off-by: Daniel J Blueman <daniel@quora.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index 0400ca1bff05dcef6b742c3fbf77e38adca9f280..7dff7293fd5c834b0ea617ece87ffbf0d40e821a 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -84,7 +84,10 @@ properties:
>    dma-coherent: true
>  
>    memory-region:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Firmware-loaded codec carveout
> +      - description: IOMMU IOVA reservation region

And how does it work if there is no firmware carveout?

-- 
With best wishes
Dmitry
