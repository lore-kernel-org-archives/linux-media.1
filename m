Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795094439;
	b=zSYcgsKjTh3iSaRAASGgzU7YgIwdi6fyHATWW+9Mg4YEBl6JazsprSVk6xpcVdBBBYWr
	 wQjDDcy1o6aEVPOMBDOnc+k/pVwyE0HPyN7u0yZ794awLyXqrkqj8sYqkknY6WOmbN/Yq
	 5u54p9DtdjuaDBYtfqBptt73pFe5ile9ZBk5G5jAFFHeqYlkJwvHzjldARehXm2Nn5f0U
	 tWLGB+Z0YxeiZT+BzldTiSc6Fmm9sEpUb4NHbCJPfDCoaYNAV72CWjxrDFHLqLl7JyUy9
	 tQYTI58Q5pVCH8i/65MCkBuibBFwbMHg7K3MBHu5xKs8GJ3hqWLGOKLxOBekKPWG6oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094439;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=dNGD8cBwQpd0VbuT805npGlElNBu5pYxhINVSOb0jkU=;
	b=fnUoYNVvM+4EpHssVMJzEVZMODnNWepri80WWPsGWzdt7O5M0daMjoA999D/f/hT6kGx
	 kuDMWMBTJEH34HRvxtWemhhMCXi4p6Rri6nZlLxeZsi9mXwJjFb0jd+gwnRpgcL0KPTCK
	 NWmZ5gvUerJBeWhxpHX0Amgh0FyIeLX8rXddSmKhld3QXC+DCcmwskiq++7QAdtlGllqr
	 KyAvIYXIhgU1+MJ/8/GUFsow06k9nXWrVLyZChQ6QP+5z6B8wi6L0XIWsO6MwODJlUhwT
	 vCrt9d23Cg3rvgB0IdzVU/KDOtPsm/8xSObkV4uHtBcM4r6Qy1gZHiC7DZm9kWR1NQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N+cIGwMZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2CE606A320;
	Thu, 19 Nov 2026 13:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N+cIGwMZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 309E91F000C5;
	Thu, 19 Nov 2026 13:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795094439;
	bh=dNGD8cBwQpd0VbuT805npGlElNBu5pYxhINVSOb0jkU=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=N+cIGwMZJyqVaA2RhU4nUz0Il07IadwPgCiGeEpBf0lObBdxOrI312C2M5zPyjnaY
	 u0V6YL/y1Y1FLyreIkS9ZTvGG266e2pD7fgK6Pay+d8c3ETR6LfvDOxYP3mh2pe7G9
	 MkXxG2T7zODtLRHYfXIx5MRFI3snRU0jZhaKR71/ySFW7XA6i49Xioa617xBIeA58b
	 kOolQdxLPH17h+6ZcN3FEB+CdMaM6/k2WuRoRNbXRTPrThncT1dCEhcRwIq6KZXmYS
	 8gK8wijyZHjP+P1roUOteVf82y2yjch5/9Mc1PErKzOz4OfOZnyDluVtPVMSU68jKm
	 Sr03CpDz+01tQ==
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
Subject: Re: [PATCH 3/3] media: qcom: iris: Improve diagnostics for system
 and session failures
From: bod@kernel.org
To: Dipayaan Roy <dipayaan.roy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, vikash.garodia@oss.qualcomm.com, 
 dikshita.agarwal@oss.qualcomm.com, abhinav.kumar@linux.dev, bod@kernel.org, 
 mchehab@kernel.org, p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261106153126.120858-4-dipayaan.roy@oss.qualcomm.com>
References: <20261106153126.120858-1-dipayaan.roy@oss.qualcomm.com>
 <20261106153126.120858-4-dipayaan.roy@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 13:20:34 +0000
Message-Id: <179509443445.2846709.5391146135790819802.b4-reply@b4>
X-Mailer: b4 0.17-dev-e3fc9
X-Developer-Signature: v=1; a=openpgp-sha256; l=562; i=bod@kernel.org;
 h=from:subject:message-id; bh=D30r3ot83GPgYIP7ptT78+SN1sH5pIpDAbdquT+XSG0=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq/vei2PzAT55W7kadPXDHOBvTRqzR2JfNhZ6qW
 XnUY7+TRsyJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCav73ogAKCRAicTuzoY3I
 OtnJEAC5sVDGLRL3UQ3TuO9kU+XnruFH8y+KWGEQa26y8/huuUgXg08b21Dk2bouFJlawja/BbM
 VSRhV5Ab1j8x1OaD3qonA0aC2zSMXOGatK61wjGq2dNibRL/MkRIVKTb3PKXYWFDh4NqgvLm9cS
 E2jJ/TFHTstUSV6Ute4fJoao9baJmFSl2qZYQXK9DZq8/2JF9Q+Nbr2A359KROMnXpw0tLIG8tH
 OEsZpkzAjTqKGleHGHmmALGPUIqhB+EHL3DzY67ODONgoFMshWaGorfLU3MoE7bKPrbVbeXCITF
 Q/IJ5IWBc+VpU0ngHo9rYtQcQtCtMQLSw6OV6vG6vpnMJURAnqPWu+KoyCmfshKz4+sn/P3oOBd
 Q4IgiWMvcsc9b3bm2STi3xoqZ2SHOg5u358N++UnF6awufn2o4REv7883qBM72TxGEUEkwlQljJ
 C3RU6vwS/HuNvuCRUxexceAa9uC+4FeBqI6JXF6+S4HNmPpDjLRrUu3trp2pRMsdcz3E5eKDDyt
 PVN0bYahpP6I+emZEEmmokvi71ieNjknY5lE/O1yUggkgkdpox72+lNA9s3W1WIz3q4+B1Nz6DV
 K68Qn/7PX3bkqwyHjqyWbEY93AzxpENmqJEdCrAxj0F3Xs+QhM6+h3zFDp8LlYl+5SHDKQr+0fd
 R+L2xkPmvsCMbkg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

On 2026-11-06 15:31 +0000, Dipayaan Roy wrote:
> Log system and session response timeouts, firmware-reported failures,
> and failed recovery attempts so the cause of an error is visible.
> 
> Add debug messages for unknown sessions, invalid state transitions,
> and successful recovery. Avoid a redundant system init timeout message
> after firmware reports an error, and rate-limit Gen2 session response
> errors.
> 
> Signed-off-by: Dipayaan Roy <dipayaan.roy@oss.qualcomm.com>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
bod

