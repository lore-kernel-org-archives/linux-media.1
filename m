Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699038;
	b=f98AJegMr710U08LmvsMYCMkRCxB0B2pg3Rtr3zafKpdE1fYeFOMIJflbvwhIrMGm0By
	 I8bunrgxgc4GguSTwq1WUQsMxL9ig2Yn/qQdnB5crzjVrpIlsgCzPeTu5dcnoOZVNmcJD
	 602giPpwh9jQOFY1Fvrqr/nhNX/Qdj0SjVdAkZ6veepR8qCwyS3J8uOzgeJobkxp96HhV
	 rbFYk6DghiPeRBO/NjowdI3lmgtCugKgNyML3AoTNDMguEXAAvyYQlbq+ZEKUN4cZt75o
	 GMJm9b0thvAO1nXBmxcce6daQp5hK35bPOVZUSxtQFgM60Lb2JKFmZKbcXrhp6c9JXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699038;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=iGhcK9aeLpuBQFCiWB+nJdiq9m9MtnI1NySrRc5PaoY=;
	b=ywRWUbVPmvU6FaVpKFpYkpfLaW1ZVWt2i0xCCERYEf/voHfM8/ecwDxh3U1OYlruEkzm
	 yQDnvVQOI8ETsAaXMJsP7d61dfhzzbFkvx5C695I8GIkD0JsRPkcxmTCNZm8uXsTJ8dTy
	 GCbY6oogQolxB5dCXD7QBD1aLCUcEdauPy77MsodUrin1zDS9xRcf20Ip1VEjRAs8HBdi
	 OPJSS6RvZqOUi1GhjqCXYnktErYlY2QjTVNNYtaqBV/VMUt5ZRIFLha1SFLO6jX5cz74l
	 Io9cN2hygmDj2+6rW8carOd8HNXxPfiYL8XTZIV62hA3zqRaIxx2bZGzMx/DoXS8wyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gXZ0JAqx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C05C606A31E;
	Thu, 26 Nov 2026 13:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gXZ0JAqx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCAF71F000C6;
	Thu, 26 Nov 2026 13:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795699038;
	bh=iGhcK9aeLpuBQFCiWB+nJdiq9m9MtnI1NySrRc5PaoY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=gXZ0JAqxrE9sEKxe36izAsGvMAvY7wkvbyQ9rnA423vEse+xcyZp12R/GcUI+wR0b
	 TZ9t/Ql+XHtB3eN9s+vJBNL0j86hlesdsR5QuCxrS88BPFZoLT22yOyHyR8j0kxqlU
	 e99WF0cqhKV9ERUkTIbGViNLlGTHFR+Ildx6M+BN6p0ggC4zcMna8Nm4jnnOyuY44k
	 RbN9h5YWvZScwRZFqwtKB2zm8FCKyid/BjrhaMpig1FDc0iZLH+/eZqMBGjoJ/h290
	 Ic8xHH7Zdr2KKjg5ja7H93NyOB2dVwlU0/ER0q9AaPfmH0O77x1VmkmAzBpyINlxoQ
	 Pe13uLCUKvqxw==
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 1/3] media: qcom: camss: x1e80100: Use the lite
 clocks for the lite CSIDs
From: bod@kernel.org
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jesse Casco <jesse.casco@gmail.com>
In-Reply-To: <20261126-purwa_camss-v6-1-5ab97aea3832@oss.qualcomm.com>
References: <20261126-purwa_camss-v6-0-5ab97aea3832@oss.qualcomm.com>
 <20261126-purwa_camss-v6-1-5ab97aea3832@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 13:17:13 +0000
Message-Id: <179569903303.596873.12740701508586858816.b4-reply@b4>
X-Mailer: b4 0.17-dev-cdd92
X-Developer-Signature: v=1; a=openpgp-sha256; l=1024; i=bod@kernel.org;
 h=from:subject:message-id; bh=4XHZmc7iJS9QgSksNiDbY65D3r5x08TTl+qG8U8o0hY=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBrCDFZXR1cTd+3OFrVL8CvZvqJdOdC9gCmCFW5a
 l5jmUSCPjuJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCawgxWQAKCRAicTuzoY3I
 OjOYEAC49GTH2/8C15ID2wpZdcW6RaJj1mVvyG7MVrCpFy3dsT7xIw/5niRoGRDXjoo/BnQRlV2
 ccHLbSVbrIxHRH9AFL2tTVnYJvNQboPPYBqZ20aD7qss45p3f+JCaVJWDkzqvlzUQkR0+CBnRHx
 pr83RDYlG6prwbbLhGIKhLkMKeYVfN2w8qZ0LexOSyOraBWcpShMsCcIJiQpI+ao9izFh5dsPw1
 ukwi8cjG8zxhvcqnVr1eZNMaVGWYXfLriC4U/nSM59UZEr/poS/4Yq3bAhFsFiNF3+etEe99RGl
 3Iwa4ir90zUMGKB6FVi5jiyxKYSrpc68zTW2fVPuPwUR9m8GaTehcRhFlI/vflEgIQz75KJ/IvW
 pQBHYKpzzTAi7PyxvGObVqCggvXl75nCTdfL0ycvecXWiJEzln2VB5k4kL7U5IO0lQW+lR07/pZ
 gWizBDjCO8KTdQrheeaN/goXJVEl3xrG+sApIdX2e4bw2jtPHtlTFXVebQXSoKN+GflB3TjU32R
 kQTweLUwsvSqXunjYX5tzg5ZhET/ULAZVulgZtTMCqBAkt0AzFmuH7vHfW/3G0E0DLCPUqNlfwQ
 Fi6NX1gHyGRKc/E3vASo6+eeRKcC4+tBZJz3dMZf2sJ45d9l7fRl7In3tMntZoVpBEdVMmcr8O+
 u6fcyGEOgDaMD7w==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

On 2026-11-26 19:15 +0800, Wenmeng Liu wrote:
> From: Jesse Casco <jesse.casco@gmail.com>
> 
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
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

Already applied.
---
bod

