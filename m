Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D712F504587
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 14:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420416; cv=none; b=fW4zR7wHD/CyiNBAHAy/ty89A8hNd54zSyOy8bCTEuhK14Pg7500An0E+VaI+NF8O4565lLJlJVHtGtSJhSND6y/9M++3yAUQC1P5Floyr16K3KV7CH9xifAGJ1l/EEqNETZLC4Yr0JL9+cG/GhnXXZMt1TbtCBgxQmM+IUwaoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420416; c=relaxed/simple;
	bh=vOR23NOgkIyph8PSVCEojvzTKea/l7YYWzBnH1JHOrw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QS3UY7dpy+NiGi4CeHJqpydE4WAgjWY4tqyRzWDKQfkvOEAgdsXiTvCfQAPSSs238MOYOBj7TMXWm3Au5aNX4ggzrZwhuqMlt63SyQUGelvgZPBk0Lab77isu4KQKUoDH19GgRPrDYs6EWQvwetTNZUWM10NqhvCxhzMm7luyFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EHbYAZJC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BQHAD8eX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EHbYAZJC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BQHAD8eX"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0fOC1904049
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 14:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xQzFpTG8PW7XDUO7ySPH2DY8SEuHykZsaeu/U0Y+X6g=; b=EHbYAZJCV2IJNaWl
	Ff7lXgpRzzicxJ1z/lnpLVXMxnQvwP2BzjWRJvIF0OxBZjz2IVs35lIsWy5Ov7q0
	48OtJ7ESJneiv0CSL1VHtfhgYHP9ej1RrdohczYDBpx8qeeJWd6uonLIaPuQ87Ow
	BJq49+m5iVEs0aXwv9J2+GGQYrr/527slE4Ys8s80i6WZrcFY/jOHhimTCYwScwr
	a6HZ0uKbcQ23zU6O0k1jDy2J/rWw0mAE6YQOw33Mh8Esn2xrJ/Cx+isdjQ/BUswB
	p4l0P1ez+ImW8d6Vd+Q5LuGftXa/PpWU4KCvlHPYljsKNE699TTOvUPlcgRMwOUs
	0dodhQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf5c9n36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 14:33:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939c30aa9a0so240080285a.0
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 07:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792420413; x=1793025213; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xQzFpTG8PW7XDUO7ySPH2DY8SEuHykZsaeu/U0Y+X6g=;
        b=BQHAD8eXFpidHMnR1tUtOhG5DXIn3Xn89jzzUPyq36Ef9ZZDMoJerRtrBrXTCVjXg1
         Lr1cUyVVvbLX2K6wf2p8WS7t1jMIAdmeS1TEkyDJcNkcVs6hxPWcHO2OCea7/ZyZ+N6L
         b8o96VpT5kXJe0WwXAmxMB/8wEmXsiMB8/RKMUcNPscwqbsaLhTGh3RDkXi+FgWwg6Du
         rAZZZyWDnnPBmqdq2AikQJ/B/vPRMvbr1WZnMT6tQ20fdxY1CJeg4IXOm/lX/Z2wIU1K
         Zj25QZZk5eD3tirNeLMJv/BaizlgGrwzrJQttZyYKSW+/dW3GzDIqnku3eACXNgjfTwJ
         SpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420413; x=1793025213;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xQzFpTG8PW7XDUO7ySPH2DY8SEuHykZsaeu/U0Y+X6g=;
        b=jnd9sBO/wWmVpB07JEF248U1jBv84+2/rAG4yIXYbIlDV8Cw8VBsjk2cjJXPjTtixy
         rP6S3dDd+aeSBcwXsHp0WM3gDNzx9zHTHkiWJpt3st1gNAs7+QxuMw8Lk3AwFJ1DPB2Y
         LuLhwhz7JQjRB055S1iU4faqxvp/F08v5LJDg8XIB5PAZxmVR5nqIzfyvSlti3SiA+tv
         QD9qqMi7S5biGaSGzKq88ZUzD/Y0xbNfX7SMg8HC4Oz1pGkiLl3uNw7s7US+2yTgY6pK
         u4g4G8/Ye+E7wYiUg9WD7DOL+Ffrozb1SBiWxxmFhwoq/iy9HKlnISEh51gPo4KtO30a
         E+Ag==
X-Forwarded-Encrypted: i=1; AKwUvBxzSKk/qYHvJlxVfve+v4yhMDl2J81asXx1U+UZyMLW2/Q7J3DKY7L/Cu7Vhxlcgho4lhQC83CztSVxAw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLuQ+9wYxkZRnM0cOoIUwh+R5Xl/sAaAQIq6TGVOdvHNxc/sRtJ
	456xcRd8bdeOp/GpcZpzzxDIFDrW2gLfEtOx44C8NUAyP7i+xTSkFr7OOz01sL07zt0Yf91sK9H
	kZav3nzX+pdfTBotpwMlqkJao3iz5pCA3IT0O6iRcLJjuoaHDbs5YYOWgxhIbXcP3xA==
X-Gm-Gg: AYBFou0BNcmLMO24kJCWHY6/JC0kL2Hmrj7i2jKrSMiRHIdBiIQrkWGMJR02zdzqQAY
	SfU4ipac2tQizX0eZlfjPTjwraBksXNXBqB8Fs9vITUIe+Eyqlv9r/rRUBKT9YM/pqQr6Ior9qB
	4bfT8JPHCKsTupIBvtCq/tdr73EzZHFL1jN19etcpwf2jCB6Covj6B+8BLzMLT4O5T3TifillMV
	N3vBse1u5reWPHRqy/Tqqjh7/70uxCCEOsTvqQr0p9Ty5renIYFkLg+noLv75pFjOtAr24IknSa
	0hbVZ0B7xUhYvC2xC1lDU/cB2pSWkCoi6lRSIcPGIUaoNTCeMTaiQgtrjX0+53rPNnJpNeaTKim
	cepLO8cHt036H0x/LZIM=
X-Received: by 2002:a05:620a:40c3:b0:93e:7ddb:5098 with SMTP id af79cd13be357-93f29cc68a1mr1285814785a.25.1792420412956;
        Mon, 19 Oct 2026 07:33:32 -0700 (PDT)
X-Received: by 2002:a05:620a:40c3:b0:93e:7ddb:5098 with SMTP id af79cd13be357-93f29cc68a1mr1285806485a.25.1792420412309;
        Mon, 19 Oct 2026 07:33:32 -0700 (PDT)
Received: from [10.40.99.41] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c409239c154sm376055666b.87.2026.10.19.07.33.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:33:31 -0700 (PDT)
Message-ID: <48e3f967-be0c-4bd0-9e6a-a804ab2e053e@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:33:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH 04/10] clk: qcom: clk-rcg2: forward the gfx3d rate request
 to the parent
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-4-370949e4d8a0@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20261019-msm8998-fix-clocks-v1-4-370949e4d8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NyBTYWx0ZWRfX6klUpr65xSKp
 tJjjv+Q/0fLHVzdlzEiWz0TgWps7TdlCI0AM8vmGousz1Fc8qYhB0a8kuMEtuCxgIY1275yLKAD
 4EDk99IHsb+WvjmBE8xv7Vt2lAkM7fA=
X-Proofpoint-ORIG-GUID: N7-wu_OMGajGHDwNFVhP-TIgLd9AhOys
X-Proofpoint-GUID: N7-wu_OMGajGHDwNFVhP-TIgLd9AhOys
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NyBTYWx0ZWRfX7YCtCuaizaf1
 6ye0sXH1nFPyZOAAWiM5fJyTs4nSsG5ET3ieWBRUNoVi3zoxqUqX3Ls/YsRrfhWnAe6q1KDp8U7
 msULlHa246yCY8fD9A0ykW202e8vrmAgqyGp1Q9ZAggsgypii9vMq1YHJrGwSpaR6oSkI1cM5WC
 xsG2iqtedwYvQXj79hvo4c+44XCVH2XAcaQRqFmViAhb9RDLo30T7yKq1W/oAQyJzb384HHOvo1
 +XGVGg9KHcCL8rCUKZfy5Kd9ydCUqI0ka774aXo10IIMbW5YSMdeJFIYmg72iiKeUv0CTk94uvc
 EBY9+DE/e1CryipXQiOqMhu92l7ntqNuDrup8UIzUvGemUG4y66vPF93vu1xHCITJvNZH8TjeLF
 fYUShxrtfdZq1sF3vbhEG2oGLGeMtB84xFrgNTEcUA1xggq7VY/GqZCksnSvevGizcOrg0ZSBAe
 zTDBZlj+Rb7JdYOW7yQ==
X-Authority-Analysis: v=2.4 cv=K6O3jCWI c=1 sm=1 tr=0 ts=6ad62a3d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=rrvG0T/C2D967D07Ol03YQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=eOnteo6YT6IUeBgu2X4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190057

Hi,

On 19-Oct-26 3:41 PM, Dmitry Baryshkov wrote:
> GPU DVFS on SDM660 never changed the GFX3D rate. clk_gfx3d_determine_rate()
> builds the parent request by hand and leaves best_parent_rate at zero, so
> the PLL is asked to determine a rate for a zero parent rate and the new
> rate is dropped on the floor.
> 
> Use clk_hw_forward_rate_request(), which fills in the parent's limits and
> rate the way the core expects them.
> 
> Fixes: af1e62f2ffe2 ("clk: qcom: clk-rcg2: Take clock boundaries into consideration for gfx3d")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rcg2.c | 21 +++++++--------------
>  1 file changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index c44c51d860e1..9e3d7e5c81e5 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -1207,10 +1207,10 @@ EXPORT_SYMBOL_GPL(clk_pixel_ops);
>  static int clk_gfx3d_determine_rate(struct clk_hw *hw,
>  				    struct clk_rate_request *req)
>  {
> -	struct clk_rate_request parent_req = { .min_rate = 0, .max_rate = ULONG_MAX };
> +	struct clk_rate_request parent_req;

Just a random drive-by comment: You are now leaving parent_req entirely uninitialized
filling it with whatever is on the stack. Where as before all values except for
max_rate would be filled with 0.

Are you sure this is what you want ? Maybe:

	struct clk_rate_request parent_req = {};

?

Regards,

Hans




>  	struct clk_rcg2_gfx3d *cgfx = to_clk_rcg2_gfx3d(hw);
>  	struct clk_hw *xo, *p0, *p1, *p2;
> -	unsigned long p0_rate;
> +	unsigned long p0_rate, parent_rate;
>  	u8 mux_div = cgfx->div;
>  	int ret;
>  
> @@ -1234,12 +1234,12 @@ static int clk_gfx3d_determine_rate(struct clk_hw *hw,
>  	if (mux_div == 0)
>  		mux_div = 1;
>  
> -	parent_req.rate = req->rate * mux_div;
> +	parent_rate = req->rate * mux_div;
>  
>  	/* This has to be a fixed rate PLL */
>  	p0_rate = clk_hw_get_rate(p0);
>  
> -	if (parent_req.rate == p0_rate) {
> +	if (parent_rate == p0_rate) {
>  		req->rate = req->best_parent_rate = p0_rate;
>  		req->best_parent_hw = p0;
>  		return 0;
> @@ -1247,7 +1247,7 @@ static int clk_gfx3d_determine_rate(struct clk_hw *hw,
>  
>  	if (req->best_parent_hw == p0) {
>  		/* Are we going back to a previously used rate? */
> -		if (clk_hw_get_rate(p2) == parent_req.rate)
> +		if (clk_hw_get_rate(p2) == parent_rate)
>  			req->best_parent_hw = p2;
>  		else
>  			req->best_parent_hw = p1;
> @@ -1257,16 +1257,9 @@ static int clk_gfx3d_determine_rate(struct clk_hw *hw,
>  		req->best_parent_hw = p2;
>  	}
>  
> -	clk_hw_get_rate_range(req->best_parent_hw,
> -			      &parent_req.min_rate, &parent_req.max_rate);
> +	clk_hw_forward_rate_request(hw, req, req->best_parent_hw, &parent_req,
> +				    parent_rate);
>  
> -	if (req->min_rate > parent_req.min_rate)
> -		parent_req.min_rate = req->min_rate;
> -
> -	if (req->max_rate < parent_req.max_rate)
> -		parent_req.max_rate = req->max_rate;
> -
> -	parent_req.best_parent_hw = req->best_parent_hw;
>  	ret = __clk_determine_rate(req->best_parent_hw, &parent_req);
>  	if (ret)
>  		return ret;
> 

