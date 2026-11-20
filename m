Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174702;
	b=ZkqU/IjxtAW+4y49WBYpCkVdSB+qXWibFq5Y4UFbv0qV46CKlGsbSzPYH7/6VWGIObgZ
	 BU/hkYHDclhia9+J7Tjc7W24ji+TQFCOuHJ/1SvnlI59G2yOIKfc9+o2FVGbnLZ8A66KJ
	 ZMkYFtx5b9ZmxFVW7NEJcCytNDcoi9z/Kw23TBjNrJnJKf/vM62NIoX/pPDrm1jnAQsBA
	 cEfykCsbHYJ+VzfuJZvo7vzJbK1uHYYHHkGyHoFxpJDjtPgZSZjvWy5UGLlgznaxxNl1D
	 BDkfUVznXhw0zurYukjrT3tlwp16woAD3xYfcRS52/8Czu66AIMGNZiKlPK0jWzOp7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174702;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=u54cQqwoXuKvwnzVQf138h783cCdoqz6Rg1UB6DkqHQ=;
	b=jWao7ehy172QVLDgmy90hFHUew5OwGQ3OOpGkDYJzTc8ZThQyOszqWGUcFot5KeZeEXM
	 P5J5jzt0fyLjbpbfz4hq1mpZlK95Tn0YEPSVLfyuKRNQt+7pITdpRfRytTNeGzErAnEta
	 9zELhjo58bMvaR8RBTGM2m/E6jNjaOxC8kqweO4m0QAI7oiH2MFg8YqrcV4HvXfkPmvw5
	 N/zJUCkqTASNfitTbi3LZa0+MiQkfXA2ajCF3gEWWDUoVQ70OwifS8/j3dY3ifIbr8bA9
	 HMF6tjiuno0XvxIkjkAv353PGsOGV/4Thom4CxoA8QiUqtI/5q6LEaxYmBA8Eb577vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aemTvuVu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF2B606A320;
	Fri, 20 Nov 2026 11:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aemTvuVu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AFF91F000C4;
	Fri, 20 Nov 2026 11:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795174701;
	bh=u54cQqwoXuKvwnzVQf138h783cCdoqz6Rg1UB6DkqHQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=aemTvuVudsM7LYHU188Z0ipfoKOiKQHXrPV35rCN5/Jpm0XW4M7oNRUPNmUjEMJp6
	 HonnaQh+dNvEM4Ywl6DhPbu0oMzMbsSN60+ZCeaaM93p/bEsa0csZXGXIg/YksFc9K
	 RBkxj0fFFdlqTintZPNl7SaAxoxoGI19fRaYcwgUpLaJC2hYLExDWnUP1oAxYPBhFZ
	 ATNMMORTLQ//fnLF4jCJfdJ6fBt1qGQO559acLDXbv0lM53GvGru0fy5Ax+G4A0xLW
	 1dBpQlk4bKexMZIAFObPq0Lx51/VY0Ibdei+hr7YI0v5lZU3Rn7hE6TSxEzzUVt/NJ
	 jJ0xg9x4xnJhg==
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
Subject: Re: [PATCH v2 2/4] media: qcom: camss: vfe-4-1: program the RDI
 write master buffer size
From: bod@kernel.org
To: Allan Siriani <allan@fatecpompeia.edu.br>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Todor Tomov <todor.too@gmail.com>, Hans Verkuil <hverkuil@kernel.org>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261109112611.94010-3-allan@fatecpompeia.edu.br>
References: <20261109112611.94010-1-allan@fatecpompeia.edu.br>
 <20261109112611.94010-3-allan@fatecpompeia.edu.br>
Date: Fri, 20 Nov 2026 11:38:16 +0000
Message-Id: <179517469651.2846709.9395424676021708329.b4-reply@b4>
X-Mailer: b4 0.17-dev-e3fc9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1340; i=bod@kernel.org;
 h=from:subject:message-id; bh=mXcW7/f/DtAV/Vb8NB/afzQkqpMH7wECwoH0i9uQgKg=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBrADEoiTsj5JdiVNu3vPvfeMUJSDH0+nkUYeBAx
 AzK0Y3rgdqJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCawAxKAAKCRAicTuzoY3I
 OuVUEACrcr6SdagkxR4lq89XZXzupqRZxPTl76yOkXJS/u4D1zWneeSSLqg1aE6rg3j+OjN3hHY
 Nd2D5/USm4a724/H4Z8kFkX6H4YSoLesanbQwAtM/aLQp5xM1/hrWDt5sG1UMsP/GBnkvknFyzK
 AZm/gJUBklE/dYYUOBmOOryBhjI/NeyFNhjAHFzCEjDw5xU9QT3EHLmx270E8f/qHGWKaczlEko
 nl6301r3mADBFCqnj9q/X34mY4bnG5U8aILUL2s9ubPSZhXlDxPMsEnu8/LmW6IAEhdNqBB67hX
 EwEsRm6nz7zRxO3jyvTNf7XJgsstSWmu74JTC1Kufg0JTxevCkiojrsYAhPqAtyfCFjZ1Z3tTUU
 7tlPb3alo30MNSuqM5FVwZxZ8Zm8iTdiy/n+aVsSfcjTqM1CW6EgzZ4pRVjrw9/zL88YCnM8Dtv
 r4ec83csmtlnA5oDOSsosrBe/RcSLplHE/R0riPSX0ZVFS5eNyNC8teI6Ibk+Vp7AmhTYdO8ZaT
 fnUw2SxAa27IWrIv3H7/0S1HQ2X5G3qUhNRruRKTNWNUmyQGCuzour8/t66ZQQWsQV7t7h8lQBB
 5f2yml1fDHMn8+eCP4A27sLUf+whBcmBPgfMn94Wc1FODX1pTHwz0afY4Cwn3SDsaOgoYSRCp5/
 3+bkdIkUbzmBpCA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

On 2026-11-09 08:26 -0300, Allan Siriani wrote:
> The RDI outputs use the write masters in frame based mode. In that mode
> vfe_wm_frame_based() only sets the FRM_BASED bit of WR_CFG and leaves
> WR_BUFFER_CFG and WR_IMAGE_SIZE untouched: they keep their reset value or
> whatever a previous line based (PIX) stream left there, so nothing tells
> the write master how big the buffer is. If the sensor sends more data
> than the configured format, the write master keeps writing past the end
> of the V4L2 buffer. When the CAMSS runs without an IOMMU, as on
> MSM8226 today (the SoC has one, but it is not described in the upstream
> DT; its VFE 4.0 shares this register layout), that corrupts unrelated
> memory.
> 
> Program WR_BUFFER_CFG in frame based mode as the downstream VFE 4.0/4.1
> driver does (msm_vfe40_axi_cfg_wm_reg(): words per line, lines minus one
> and burst length, IMAGE_SIZE unused), from the bytesperline and height
> of the active format, and clear it again when the write master is
> released.
> 
> Pass the active format to the wm_frame_based() op for that. The VFE 4.7
> and 4.8 implementations, which use a different register layout, are left
> unchanged.
> 
> Signed-off-by: Allan Siriani <allan@fatecpompeia.edu.br>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
bod

