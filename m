Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034028;
	b=na2eyFqZCwiplPu4MyHarFqWp7xLZyxleSsrjDPepPSrtXQthkWR6bgqMSYQ0OiVNaqC
	 4hPabCSmoIkx5BPryu2F0t7hJVQrs0g5XNQrbJvfvDfy5eNOhk48ZvCOokoVscfOWDzVD
	 2M7FaBrEDeuhGP3JX/TEwpwHCYogF0ZQbvewWHOFWKjz4pmCnI7XHyecEm8KwtcsCXwvN
	 gYDX1hGDEx7XGjkQKPjbmeIViHCu5w7ckLCHRm+FGBZxRKobj3NTcadU6KaFDaXPJQ9ag
	 DKZ76n4h/kvo4xbf4nVahpZCfroPjcY2RH4ffoE9LVM+DLh0IvqJuovxjnV0LGvrdzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IZ8flJOS7vt4IlbZiE/b3qc9/s7rsTbEqNnieP1+rFo=;
	b=pIiNGfQeuePbReHxPReTrdNqL7q4qBVaZv8jTKXoz0F6W9bEJe6s22+588bO1rC1sgtw
	 E/PMaYOUseQdsPiWyceUX4NCJSiOi0xn7pGRbLrcqzvP1if05Di2EygwN2lxSMOjx8fmH
	 83w4vOsFxPZ4naF9I6z0iAZV8gp4o1BtmAEzixkSVB6XR1TJmCjSpgYQtB0oAq4SuPrqP
	 7KHkHFcYBqauCc45+UD4Ymr2vj2urlLl/KPucSZq4nm+oBE/gZEsqjhO5ZiFe3kz02CQE
	 Z3flfoDEuJ6tLD6IjFBKgiZeyeq19CQiteKfZ8t2gZ3EvAycjfjqbPJ1Gz7ODLnjHiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jL1ED1+2;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06762606A334
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 20:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06762606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jL1ED1+2
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2eb33b5c067so1119025ad.1
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 12:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795034027; x=1795638827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IZ8flJOS7vt4IlbZiE/b3qc9/s7rsTbEqNnieP1+rFo=;
        b=jL1ED1+2rIkiH6cLtiWQ6HaBAuiIYqB4B1afZGAUeiaNG00/sP2dcuzxprHbG3Cjv1
         q+9QwORxgJAY7Ny2UtVj/+xnHAyK8HyNSCwQudvjjmqMAYHUKYl4ZZW1PNl6adeFBeRZ
         4DiRFr24h6mNq3SfuLpNX9pYxi4Nkc2R/VnDuwTjiyUHWiszcLUGo60daNgJAZuiKNOw
         d6UeGJOb9cRzMG8j8k+G2QwpWq3Z29TcFqvIlkkzHXQIFRMx+lpes6i2VMGv8+AGNOZn
         gbU5ZFOS/KrxxTITytJMRgWoocYVAlI0PkgYb0fSxsA0/UigT4Zx5mXp1YGmwlMc2r1S
         Jfbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034027; x=1795638827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IZ8flJOS7vt4IlbZiE/b3qc9/s7rsTbEqNnieP1+rFo=;
        b=L5pOawFYNYXz6sEtFAjA3JALgrvLJkPBw3evCXL3QVtAd5vxAcoOKMs294QE9PSpse
         D8FsLUhgKOvj3GK8YeKaA8Gvf9R/vZT4w1BtpNsNXp9SRQpYye4j6hiLoIuavNCuUDrd
         bVXCbkl5hQck9iZRVJ6B3I8I2gB/Os6DpinK0zHWZvGvLGBglF0EATJDqhyCRbCG8w4N
         neAxZod5f3qbD0b3w3kw4jK7NjMOkLlBEvMBGPsjPx3sgfhaV3re1zH2t4jiY89+rowl
         TCEMI4g7BZrYTjXEw98Sf+/hqOzWqDeZmU8yKVX641U4GLISUw/U4CqbqtBbkbDWDutj
         SBJA==
X-Forwarded-Encrypted: i=1; AL+hErG9yKdSytxXA2jOA0rHkY6XxIqb6yJchlus1RJq23m3FGQh62IQDE2PcM3nvOsAUTq+3LlNgxWoJd8a1A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+C2NTfGsKoptXqXKc1G+w7rKgQS4Sr6Q8ZuHC8CFN2KmyGc1W8
	1nF/ns2fV3Kl1jlctzZvd1/fg5reiMj2fpoHlNFUWN8GlpCGKZxCUERP
X-Gm-Gg: AZFdTZeYDxQtmlHGxFj31m6AwfyAJUfIrjapYF5L3L12caIYZtyPJm3PjnTo9ZNPyi5
	wpp3rzL5QZko2ko9rL+PZnan5OZFG4uWSZxlWtnRlkfUqt7gUqEcwgZ9Z+3ailyxED98ClOpMf+
	wP5+pg9wFB2TtzH/eJtlsZ3wYAglJyqKUHc9x2pLNMBL/tPXWuoraI6fVoYqg/CUDAQSO+fECN/
	sUpJcaRHSX5X8u/rel6MdloJpdxzOqpRRJR6NyJTvxGAc9bdv/knRt01H2HFEx0zu+2bKxXu7ue
	5u/Z0oMrz7WV9m0Jm1vUiYtYSW8NfFYsAT1rMUzqNeC+8XVGHMsW7R5B37/uJCRvKWMimw13MT7
	b7bS2Hi51JrNiHTpL12VBUmN01mc0OAVcS/u2BwJaLaUgqHCpByw++Tp0mNJDZ4mup7nZjNsZWy
	QJBuy9Z4gW32Caa8oBsP98qJZdCVjwsLRDo/N8RAJQ4rXaxpK46Cz89Rk46xHH6cWmI+uwKbgIn
	uDHE/2OvY8Vtvlf7aEuCEMNPOia54cCNRT8qwPeQm0F5vwZ4VOvsbW3LjrgMebcR8dKVrBcGGzV
	V6O8QJGQfVHBM9gVUHCZgUv1JdZX1UuXvkfUyMxHb+ArJnaCCvXYVa3W/Cz/yQ==
X-Received: by 2002:a17:903:90f:b0:2ef:da10:beaa with SMTP id d9443c01a7336-2eff71f59acmr62060055ad.1.1795034027132;
        Wed, 18 Nov 2026 12:33:47 -0800 (PST)
Received: from FAIZEL-KB.. ([2001:569:52f5:4b00:cfaf:4885:b023:6316])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2eff6116331sm19166825ad.22.2026.11.18.12.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:33:46 -0800 (PST)
From: Faizel K B <faizel.kb@gmail.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	libcamera-devel@lists.libcamera.org,
	Robert Mader <robert.mader@collabora.com>,
	Faizel K B <faizel.kb@gmail.com>
Subject: [PATCH v2 0/2] media: rockchip: rkcif: ENUM_FMT and bytesperline fixes
Date: Wed, 18 Nov 2026 13:31:32 -0700
Message-ID: <20261118203134.315591-1-faizel.kb@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two fixes for rkcif capture.

Patch 1 filters VIDIOC_ENUM_FMT by the media bus code, as the video
devices set V4L2_CAP_IO_MC.

Patch 2 aligns bytesperline to 8 bytes and honours a larger value
requested by userspace, so DMA-BUF importers that need a larger stride
alignment can use the buffers directly.

Tested on RK3588 (Radxa ROCK 5B+) with an IMX415 sensor, using libcamera
with the GPU software ISP. The DVP part is compile-tested only.

Changes in v2:
- Patch 1: don't filter the DVP output formats, which have no media bus
  code (Mehdi)
- Patch 2: handle all planes and the DVP interface, and limit the stride
  to the line width register of each interface (Michael)
- Patch 2: drop "on MIPI" from the subject

v1: https://lore.kernel.org/linux-media/20261105232310.385463-1-faizel.kb@gmail.com

Faizel K B (2):
  media: rockchip: rkcif: Filter enumerated formats by media bus code
  media: rockchip: rkcif: Honour the requested bytesperline

 .../rockchip/rkcif/rkcif-capture-dvp.c        |  4 ++
 .../rockchip/rkcif/rkcif-capture-mipi.c       |  3 +
 .../platform/rockchip/rkcif/rkcif-common.h    |  1 +
 .../platform/rockchip/rkcif/rkcif-stream.c    | 66 +++++++++++++++++--
 4 files changed, 68 insertions(+), 6 deletions(-)

base-commit: 7969a6f407cf55b5254c824c87875452655ef11e
-- 
2.43.0

