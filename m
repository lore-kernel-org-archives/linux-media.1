Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699100;
	b=mTHvedloT9BkYcqpgJEJSiet+3BpL0H3qiBrAOGQ77sBo/SvaFzeXV58zv471Zb5H4HY
	 D5ANJ0gfVAidMuZIzyMEVd//tlq5BMs5ulDUeuLRdgQ02Qi4b9KoyPpSgQO1OrB7Lfnw2
	 6h1fR+V0yf6sS0TWgWYEkAMJVhNBNhwt7/je634AGf+yvnFiJeGFsdLD1OEjYKiHPVjaa
	 sQp9RiZGpgclaGQxh7ED1XP8U9fLP9MHEBSFNpcxD7tAxLjHre1GQ7WnU47QFS271tJiJ
	 1yc/MLfwzRahwit2mhwVbdyaVCUyHI0fQhaJ7OY+X4MYSgCQ5fxPMpr5DlHNGCZYrcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699100;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=50w5TnwtHKoNNcWJzKsCh3SA1N3koocOu3iOlBC+3P4=;
	b=kbRerJmOux95LyRL0MT+vC4CxlpyPdoi8VjvuIMzCWYoUlQzsyyVqF3YQ9Qz2l01qq5F
	 B+wCzHvqh1+NMPQP0d5ROnyyJTV8j15zxFLMsX5PynuhOApnNdbdUBrwzCaO3pjZMZr6K
	 vNbWQBeB02LwwglLPeEOAOYWU4b944ybAHFOqOKA/Qg/1MOfiArHEUOz2MKgo5qhiRHKa
	 kvBfCjXrsumvD5KA7kybKidDWbp/7GFcwuLzw6/BkTD2pT3NtABzr5ShLuoRfoIbMyZXL
	 e3N2BcXsrDiBJpOYvAWc8apb+AXsan/uPhUoaLN1Pth7o+T6i6BrBesmIe++jRWGMhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mH5YYYbc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C697606A32E;
	Thu, 26 Nov 2026 13:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mH5YYYbc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1EB61F000E1;
	Thu, 26 Nov 2026 13:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795699099;
	bh=50w5TnwtHKoNNcWJzKsCh3SA1N3koocOu3iOlBC+3P4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=mH5YYYbcXqfYUARrt0nWe38NLdOkQyISiewoRcPIsRBaTfYo+DHYayIQoKj795TMF
	 ZtT4wXIu1zECUBBouI9IiswjAJi3E5U44vvh/Np5MXBmkzLeMX1Dvgw0n1GZhBb5OK
	 C6FM2Le18pzBpwL5tHXq9BkS+Gb82NvG3wo0mvCtaE2wqF2W4TegM9To8tgdU2/Uv8
	 dO7IOkffAAXsMv9ePGJEhGtkbQEDkKprenff/uxE8I6lRkWN+n8YtTWVAI5AkvMSyc
	 Kt5inPHwwjJ/N7zPcFzX9ErbYF+ZzLjQDT5pbp/ITdxWeBRXRotMs88mtLEJSjFAPI
	 iLMHLd3w9EmQA==
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
Subject: Re: [PATCH v6 2/3] media: qcom: camss: csid-680: Use HW CSID index
 for wrapper IO path config
From: bod@kernel.org
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261126-purwa_camss-v6-2-5ab97aea3832@oss.qualcomm.com>
References: <20261126-purwa_camss-v6-0-5ab97aea3832@oss.qualcomm.com>
 <20261126-purwa_camss-v6-2-5ab97aea3832@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 13:18:15 +0000
Message-Id: <179569909545.596873.2198374046768172754.b4-reply@b4>
X-Mailer: b4 0.17-dev-cdd92
X-Developer-Signature: v=1; a=openpgp-sha256; l=624; i=bod@kernel.org;
 h=from:subject:message-id; bh=jTllOHp2jZdK8T9c6RR3b2JmWFa4Zs3KWqgMSIVB1pE=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBrCDGXjPCLl/7I8AjYRO4mg9gj4wGDs8pvxD+tY
 8d37YkP7PyJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCawgxlwAKCRAicTuzoY3I
 OkhzEACgUlnXk1oY/8i/Tg9tj6j32LbV8tlDlCN4qTBb/3dStUQC3RMbatjY8i+KfWVdy7tO8oZ
 ZuFGq/KCi8zRB6VNTQN/skW/NbSLhJDb8KRxYGX70sqCKS9yZMVwVxuJ+aZ9+7iGxb5Ot3wHyQS
 r9rpOqdUlJFGHx5AysjT+l3wX+bYtIGcqOkgRGhGM/+7eQdi7UzdH9uXDbj8/wiR919pCM4S0O/
 zTMQKriomS5I8clZxK4AAlPuEDELPlOlyMqzYDc4K8kjf0pNZ9lH5MRqHchYNeewM5A49GGgul6
 M18eZInuoce1b1Fm7ZeCCww9sF8MwTzNx1HTvVHiA79VW8aXjLo5XfNiNHvRJ5Ois1OvaulaNqg
 6chmFh8k5zd11B/99vw3g/WWjfXBlSviP32FH/73HMJcKBHiDoKrne4gR4+xp1Eyja3JQo5eAIv
 X7w1Rr9ac/F/OQVchd+tsnxIKzxmohysuI40Q/sQDpsSYetSlvqhCx1TzsfWlBJj/vCAE1+9j+T
 PHssGQC77PLNByNMoWM3vZgEBGFjxT3xaU0UkmRECNIU6OVknaMh1xRs7BGO+dI1j+tLe66Ze+l
 VgcYYqvzIDPU+JO8BKdQwi093OErhGdDBlRrBC+ezz0YHI+PNo+Gk12hfPUQvszHiIYHNbslZhf
 yekgm+Bb0ACJocg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

On 2026-11-26 19:15 +0800, Wenmeng Liu wrote:
> The CSID_TOP_IO_PATH_CFG0 registers are per hardware CSID, but they are
> indexed with csid->id, which is the index into csid_res[]. On X1E80100
> the two no longer match since CSID2 was removed from the resources, so
> the lite CSIDs program the wrong register and never output to the IFE.
> 
> Add a hw_id to the CSID resources and use it to index the wrapper
> registers.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

I will squash this into the patch in camss-next and add your Co-Developed-by:
on the relevant patch for upstream.
---
bod

