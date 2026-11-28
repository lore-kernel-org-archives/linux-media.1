Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795887363;
	b=ylEdESfKmi3jw+DpLkBMYIccuxoBjxCop6abWPsnV8toVoEk3KfP4BZ/UCYb6HusNIdi
	 Igo0MvDCLXL91DcnsPblsUlD8WCSYJIXsHCfZWkr7HxdCIgWR3uWQHQF6dNtKZPiWDONj
	 usb2zlq3ZeZBpV4eypotC9166dKQRrnyUjhqYWmS1LL7bKf4MMjb6hvR0uDmHv+OiJ+c5
	 URpKfXRBTtl7aAD9g/rHgu7u8eh2kuTb/EspjPL9W0WLeMCrrwRFI1H6L9xGcy9ofE8mF
	 Q1smRq9HookDX81euU8V6FM/AvlFeYGThx4t1lEWeKzheFH8fQSDqLVzH00xFO0Jo5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795887363;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=qO9HsP4Omb9n01bpVc8c+WT40hoj6Ove/jdtFoAjw/w=;
	b=gHJHPJdzO0O1iIOk1qUa9W6jvLdToTWtaSyP7cHcyMV7H85U0grlxuAV4gofocIAd/ZK
	 BW7/D9TaVg0rBygJWH+4sIcuQjt1GF1vK3Bui7S1op+2BcN+0UrW6olaXLX2+9GVitRIf
	 H/LGnC9SwMJLoXvI3eY/Q5J9BuHDDc4TJHVe7zTW69H+5x0jX57KSr8RoEBuHbhoX+R4r
	 mL1TeSj6ZR4NoDJaTRmlucE9rsDPGeYkT+S2TnYdF2pN1LR/6HyE9gEsR45U/vu8gyGIK
	 s2XfGt27lERJq3ZWsBq7yakOU7OSABCROdw5HmbsvjfukZ+40Qniwz/k+GZ5eRaeFQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PFolrwnq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4FF606A31C;
	Sat, 28 Nov 2026 17:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PFolrwnq
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795887363;
	b=hbbf7HlMrtCOM3crGE+cmCP6WDs60/RnOFKmt/wMKPGy4lcGfmC7MmPWoMUQ6AgXCtj6
	 3ES6iJF1Pu73ZKJTaMCd226rrOJ33PF4FbY1whCof6XX2XxmzgzUOP1sP8Zwb1sObKuGo
	 UgBxFGANlunvbpnmd1RaBdLo083S5sJJn+ZG9ZwO3yrTUrFKq3kQDFEpXMSavRQX9mQ4I
	 exOhYB9raMN3xXWj9cC0lCQ4211BUpOn+pD9Jh11xcDSENGLNHTP0kmW04/wPb+DJeg9e
	 mOh8hPZ5V2UP/QpwZcsEu5tB2+dXXUL2JpWrecnBPI2wv6n6se9C2T2HokZaqCwAOJQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795887363;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=qO9HsP4Omb9n01bpVc8c+WT40hoj6Ove/jdtFoAjw/w=;
	b=shH/132yBlMlsTy9NTzFQ69DlGiPL6TNc5C8MlMNMo6o2RHCxOx8Q7AH771RIlGzvVAT
	 +NvJjreC0BRNkch1i3tEqeowIn5meL18za/D6KT2Rx0DPNT4IeEs0sKpgv4NDAhSBEsUG
	 kxObpbPYLaYl9059Drtu+R2O2U1OXWudYlaIwrokb5KR9L7MMtpvBgBDXF51d0smleR2g
	 EiCynA5Bx8qciRilKJlUt7WuGXQG9aw4oNrkQJErJX4srnI75wjRBqJWms8DPWdGrtjtz
	 UIRVJLMGtWNC7EA8yWhnJXRxElr758R0Hcrpv+9IIe0Sb3pcu2wZjfM3XSsZkUuU7sQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0AE361F00924;
	Sat, 28 Nov 2026 17:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795887363;
	bh=qO9HsP4Omb9n01bpVc8c+WT40hoj6Ove/jdtFoAjw/w=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=PFolrwnqcJC1fr6bvQ1zqdClXqqwZIMtHI3SDllmTAYlVaCbLKai1HdM0qYv4ZaYy
	 Rl3GqIs/xIa4yWhRHAJZBrchcvA3+qqqyIOzSa59fByR/6wRRaO1mNSfPc9Y0WX/8n
	 pzbvLLj09gNqOBJKJBS7P7YCdIQd7COWKIQC3XrD1S8JBxgl2WQfaeWnRhi2+Of+ya
	 jyZ0+GAmhQxowLG/XlIBjxvfB1SchPY+PZm5IVk+cDK9zp1W+65tyBtF31JtDKZEHj
	 vQyi9tOgu4o3Rce6a6UDb7gZZY825eW0yTMX+wmab/tvETRK95FQyevwcmuD/2vXEy
	 CyGiKr9Cf6qzA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 63FB94E173;
	Sat, 28 Nov 2026 17:35:52 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH v2 0/2] media: cedrus: allocation failure and capture
 payload fixes
Date: Sat, 28 Nov 2026 17:35:51 +0000
Message-Id: <20261128-b4-cedrus-generic-fixes-v2-0-af8472be660b@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr0Jm7RjagIIr72FYwHQKY4SaFoiGc
 HcLxqXLl/lv3gKBvXCAS7KA51mCuCGCPiRAXT20jGIig071SSmVYZMhsfFTwJaH6BJaeXHAgvi
 sSJvamhyi/fS8H6J8q74cpubONG7vtkUnYXT+vadnte1+lfJvZVaYoi1tnhZKU5E317av5XEk1
 0O1rusHDlibTtAAAAA=
X-Change-ID: 20261114-b4-cedrus-generic-fixes-8ce71c2dafd5
To: Maxime Ripard <mripard@kernel.org>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795887352; l=1257;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=dJGnmVJGpSJaB86690jlc2NnembJd/VR2+GSpaAGP1c=;
 b=F6GLmg1EGyXRb9oUOc0xusNvvZCBujsLbLSA5KQe/uDZGRfNSoVrU5kZIhF25a4Xfag2E3IBk
 Kw5yGqSEUQRDtGMbDWNykmFcCaUccclorEgBgMwj3YpAQonIJTqD0tt
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com

Two cedrus fixes, found on an Orange Pi Zero2 (H616) and reproduced on
media-committers next. Patch 2 concerns the private plane of Jernej
Skrabec's 10-bit HEVC support.

Tested on H616 only: 17 x 64 MiB REQBUFS gives 12 buffers and no OOM
kill (next: five processes killed); 10-bit H.265 bytesused 12441600
(next: 15552000); v4l2-compliance 49/49; MPEG-2, H.264 and H.265
bit-exact.

Developed with Claude (Anthropic) as a coding assistant, which wrote
the code and the commit messages. I reviewed and tested them.

---
Changes in v2:
- 1/2: commit message: only the IOMMU path is affected (Jernej).
- 2/2: add Jernej's Reviewed-by.
- Rebase on media-committers next.
- Link to v1: https://patch.msgid.link/20261119-b4-cedrus-generic-fixes-v1-0-f9f50812c85b@gmail.com

---
Arun Iyengar (2):
      media: cedrus: fail buffer allocations that do not fit with -ENOMEM
      media: cedrus: report only the picture as capture payload

 drivers/staging/media/sunxi/cedrus/cedrus_video.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)
---
base-commit: fb8b2c10a588f1384b98280b1c32307da9db4747
change-id: 20261114-b4-cedrus-generic-fixes-8ce71c2dafd5

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>


