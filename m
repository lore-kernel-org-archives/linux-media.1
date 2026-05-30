Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB72E13635E;
	Sat, 30 May 2026 23:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780185456; cv=none; b=G9ciF6O0mo7+0eC0vYI8wfFAFSKC+X1QDu4gAgYEr01CnUPdWiAjx0TUdyC4UtReFnzRXriAY4JSWdusYKjzRdJ1b4Lj+asD4MKw0L5Ebrmu05B4uxZn8XWWoOQPlZWWM79gNdKUU3KOetY42iez/gQgmC66cjR06i/q4mmBlEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780185456; c=relaxed/simple;
	bh=AKhR4hHdEgRi0QPmTN2pCcyDAEuhoqI1K7KsLfpo7Gg=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=KaegQ4CgIOWAzj7CE0iz/O1nJ35UdweabxcEY1TbyaY3lA/xRO4fZdxgUQLiHWFgbqtdKNmwNN6dm8ahRfV3ZNOTtUm1cl7LrG8qMDhWR7cdM79X+r/fgQuLKj//E/9I8wzlkAQXw/0Knp4BVp1qiMh8SwRvsRGvtLFYj3rJRu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fEkPlJxq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fEkPlJxq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D6C71F00898;
	Sat, 30 May 2026 23:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780185455;
	bh=OlIWu1YVgEeDsP/+Jdgz/RMgRZrJ35FXSqYcnoMIa3k=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=fEkPlJxqYmBqv1iXRdrJRPtpqYl9zv+amHgKmc4ovA8FZRzvHOi21gAgX9dDQSANO
	 /KgrjLq63mQFE9bwu7bNwVNbleQsc70Pmo51Ae74TT5AI5yJF+dW9jF2yIcG4FkUJh
	 8U+5Y21k0Gf374sr7KGTa1RE49kDtDXqBzH6/9B5uGilyY+Q2PCWkjZVMLHrSjLeyn
	 FYNryjTBNyCU4xN5CHfoZRt/PTnTj+9tHqgYSQoWxIBKu5+nk2E8Q1xMkmjSEjG5Ko
	 8CodkAsmu+9ZkomNU841bUzOFc0+quZeQVYRnpfK2imAkUjcof+qSEIzshP/q9PvXX
	 RnPysFxE7TpFQ==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 4/7] media: qcom: iris: Remove dead assignment in
 iris_hfi_gen2_set_tier()
From: bod@kernel.org
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Stefan Schmidt <stefan.schmidt@linaro.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260423-iris-code-improvement-v2-4-9e9cbf00f9c9@oss.qualcomm.com>
References: <20260423-iris-code-improvement-v2-0-9e9cbf00f9c9@oss.qualcomm.com>
 <20260423-iris-code-improvement-v2-4-9e9cbf00f9c9@oss.qualcomm.com>
Date: Sun, 31 May 2026 00:57:30 +0100
Message-Id: <178018545054.10222.5642789399590537594.b4-reply@b4>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=1497; i=bod@kernel.org;
 h=from:subject:message-id; bh=AKhR4hHdEgRi0QPmTN2pCcyDAEuhoqI1K7KsLfpo7Gg=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqG3ls5w525HeTWViSb83ZEyYzmU+El9HTzHZ06
 B3kncmj0UOJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaht5bAAKCRAicTuzoY3I
 OobhD/9Eh4jCEs7d5VdcsXbs+cDhVAg1IRWeesWxhGRu86Z4rE2mu/wEDip8eGtwHIY0Nq1U7e0
 PI4+WIr6tb89PPlu+6DQhCkR6MryHp3Ge9BfnWXNIs8ihlGlxrhLbTh9F0xk8AO6UbsrKfyCkC2
 g3ACmeRp3ff8vp6d9qtchAqHR65xF9UB1Q+PbgSGA6P6sdoSjQudk1U9bEOTmWDlPxP4ycQXvUT
 kdX0u04j6HZUgN8MukQry2zoeZf+bOBH0y1T00kcR29JZRVcBus2VlZCvDieJlEph4GYgQ9qkJ6
 I2pGO517TFLM1phiX+S9uQqgxuVkqhFR4nOdQ+yFU0aH601XZipGcdn+HgKfTNFN4hjTZ5vaKt/
 M2U/eFoIY8uft5DxVXll0OlRle//yBUcmLjSf2+RsFK+zPjZPPGN4hQcwwHQcseR0XaoxmJqL5W
 bbdrv2IAW0nOqPPryGelaIiIYq8qINENDbejiVcSiHxMbmqM/S1WmMmVzLpqFDekkjBC0C2gjLl
 jq76jiJmcTUlPb/SZECa/ArwP/yOC/6vi1uTqvRg+NL66uX8HXjFIkOucF+0kVZmRCyumMfDROr
 WWtvQm3PeR2uXOarhuCERZLBFYhAbXJfx4GKDU8jPTwpgLp8/C3wzWSoVwVdC0mIk13pF/KifIM
 7NGL4cp01gHX+mQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

On 2026-04-23 17:30 +0530, Dikshita Agarwal wrote:
> Fold the ternary initialiser directly into the variable declaration,
> removing the dead store that was immediately overwritten.
> 
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 30bfd90d423ba024caf6ececc827f7102e8f3324..bbecee1cc2d02a8283b3465afa686319792d98c7 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -536,10 +536,9 @@ static int iris_hfi_gen2_set_tier(struct iris_inst *inst, u32 plane)
>  {
>  	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>  	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
> -	u32 tier = inst->fw_caps[TIER].value;
> +	u32 tier_cap = (inst->codec == V4L2_PIX_FMT_AV1) ? TIER_AV1 : TIER;
> +	u32 tier = inst->fw_caps[tier_cap].value;
>  
> -	tier = (inst->codec == V4L2_PIX_FMT_AV1) ? inst->fw_caps[TIER_AV1].value :
> -							inst->fw_caps[TIER].value;
>  	inst_hfi_gen2->src_subcr_params.tier = tier;
>  
>  	return iris_hfi_gen2_session_set_property(inst,
> 
> -- 
> 2.34.1
> 
> 
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>

---
bod

