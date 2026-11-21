Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795254247;
	b=anVL7t0LkyiNfhQnpBI69cThzwHo+oBdeQI4EPOJPomrs/gRtf+rrk556H/TTGb6cVf9
	 /O4ikNQjkXR+ol/1q8UDTGXrRgnsUgrHR+aTKHmlJO3UVxHgFaDvzmYU+Hx1i41hEArU/
	 NbjuSmWoAojp90JpbO2OLuxaKBmePQoAzudKdfNKny89pTGpK6Vge/c0A6BsmriUpu3B7
	 xvO0MzzLiy2qmqdBdil5tfZUqEwL2CaCdO9yK74yVAH0JT+y7caZHnrdkYPFa9UCWDa3O
	 AlsUAF9auiAc6/C+VPLthFyrcXp2b3DzdDOBA/MUUmoI3XW/taHXTo43vTH9zhZk+3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795254247;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=nqqIfSZg6Py9n79TN9GVKXv5W/xgy6vsJTNqyxTYogg=;
	b=q3puCELSsxSWxor35dWts8DbzKpiwFtpVsmNxL0EVxoLaeWmutLWH6m7BUMTOG9hFqLj
	 MM+7obZjjrid3ckVKRoYLrvkf81WtxsOtcaWDnVFLibGw7wbqphPwsyTQHovZzLWOQsmP
	 8WzZo6QQvtVqozlb0CMb9MAkJc+1Sm8tUEJanQEzKMICPh2Jnc45BsmZoVnZckop3uBwH
	 DGQTDTpCiHnmmRAF3st2eXuGRaPUjEzBl/JAl9KgpfgzU1feVjpk8GIPU2ERmPO1mQqX5
	 xMsUwFH8U4gi9yeUQtkRwCZ83JFhiwF0XF2abi9wQdE2EIDpkMSxxxERS7TGxEkxwtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lb7enRfs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D682606A320;
	Sat, 21 Nov 2026 09:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lb7enRfs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D39291F000C4;
	Sat, 21 Nov 2026 09:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795254246;
	bh=nqqIfSZg6Py9n79TN9GVKXv5W/xgy6vsJTNqyxTYogg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Lb7enRfsMHsjGzT8WTW+o7dN87jnpNvlAlHXcYeW6Vsq0zPQGHX6gp/DjaFGeAYfc
	 vBMGD39RsVKoZpvlZd/srCbwtAYy+0NEQQ3SvQoUqfgHLiccxWcjMcW14X+iETDkr7
	 95rJ6DZ2z8yfRYY+5RxqhwdxUtTXppiSAThjc+rzrj/bT4YgYTytUqZpX7ZMTxnMO1
	 DbYSoQKR/rVkv7L2N9YlZll1XgTl1vP3/yfu0lE6lc9nIIHh+mgsVmNkOY87/S6ihc
	 eqt0GiGujSI2Aon6YdmyxsOV9l6gs8bD+uMDCrUf8mM573f+GjNx+R/Fo28xzX6DwC
	 7vM9e42VUEk4g==
Message-ID: <455da85b-b11a-46d6-9c39-09cd59d09c8b@kernel.org>
Date: Sat, 21 Nov 2026 09:44:03 +0000
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: qcom: camss: x1e80100: Use the lite clocks for
 the lite CSIDs
To: Jesse Casco <jesse.casco@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Allan Siriani <allan@fatecpompeia.edu.br>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <cover.1795196107.git.jesse.casco@gmail.com>
 <lXsjrL39xogsB7tRB1AEPdtkw2BBHhTT06NEjPRjs8xOrajFEY7fl0tczP-zzkJvsEUv56CuZ5FaOIUb4eTlKA==@protonmail.internalid>
 <bf48f3c809f33c060e2944e5896f8a5a93fd78ea.1795196107.git.jesse.casco@gmail.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <bf48f3c809f33c060e2944e5896f8a5a93fd78ea.1795196107.git.jesse.casco@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/11/2026 17:40, Jesse Casco wrote:
> The X1E80100 CSID_LITE0 and CSID_LITE1 resources list the full CSID
> clocks, "csid" and "csid_csiphy_rx", instead of "vfe_lite_csid" and
> "vfe_lite_cphy_rx", which the binding provides for them. The lite CSIDs
> then run with their own CSI-2 receiver unclocked: their registers can be
> read and they raise the reset interrupt, but they never report RX, RDI
> or buffer-done interrupts, so no frame arrives.
> 
> Use the lite clocks, with the vfe_lite_csid rates the IFE_LITE entries
> already use.
> 
> Fixes: 1830cf0f56c3 ("media: qcom: camss: Add x1e80100 specific support")
> Signed-off-by: Jesse Casco <jesse.casco@gmail.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index f8e5cf9f3..7d9622097 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4287,13 +4287,13 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
>   	{
>   		.regulators = {},
>   		.clock = { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
> -			   "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
> +			   "cpas_fast_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx" },
>   		.clock_rate = { { 0 },
>   				{ 0 },
>   				{ 64000000, 80000000 },
>   				{ 80000000,  100000000, 200000000,
>   				  300000000, 400000000 },
> -				{ 300000000, 400000000, 480000000 },
> +				{ 266666667, 400000000, 480000000 },
>   				{ 300000000, 400000000, 480000000 }, },
>   		.reg = { "csid_lite0" },
>   		.interrupt = { "csid_lite0" },
> @@ -4308,13 +4308,13 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
>   	{
>   		.regulators = {},
>   		.clock = { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
> -			   "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
> +			   "cpas_fast_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx" },
>   		.clock_rate = { { 0 },
>   				{ 0 },
>   				{ 64000000, 80000000 },
>   				{ 80000000,  100000000, 200000000,
>   				  300000000, 400000000 },
> -				{ 300000000, 400000000, 480000000 },
> +				{ 266666667, 400000000, 480000000 },
>   				{ 300000000, 400000000, 480000000 }, },
> 
>   		.reg = { "csid_lite1" },
> --
> 2.56.1
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
