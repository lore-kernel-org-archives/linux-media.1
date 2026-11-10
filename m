Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.185.170.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794300027;
	b=zSJieyAdvmhMQLuKjq2KCyOuWRzdh+2vRtv1tWWDK1HwZliE8ebiKU6uwDbTDupArcnx
	 plg5tyXEKt9Ihcms839wCItwzxBZxCzK0L1T2ty+pOwFZkU91/FF1J831DKksOliaIfYq
	 BR8AG2aKd1JszA/9O+4gdabJF0gmbVBPHNR/wcnl2ohEt3y6MkiPwk5NyZABSOxupUjb8
	 GeKskzCxSrfmrPA7XMtGN5HRPGo5Ln0mNVyRyXjbvfBegiv/f39rIIVO/I18gTXnUnuby
	 X7F1F52+zeG+XKJAoobRYeIdgplSn8O42e6Gr89lD5zsAT7mZ/Dow1v2+e0Na23DlwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794300027;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=0i/3A7qiA2WWMlFT/pdOH8q3Fnxo9nhiv273V7y0MbE=;
	b=V05nxiqG6arlSKQ+c0tjt/eLG28Fbno5j5sEj+GRWN3Ubnf5L/7v5ZFp0BNlYfaSpdWN
	 yWPlL5NTiiS2LMgQsy7mfganVX7pJ3rysxUTXjOl4dNsHngak+46JMh2u5IccvuMSqBlY
	 WogygpOk1AJpI6xbS5764PNvKMfD60v0WjqBxzsT9HkV3hHQ6qcWbqT3SQNBy1fOoMI4a
	 JZx1/PJTDBu71Tb4n+R4rgtsOb3dH2YXw1i9cWdCywSRc1B17nkDx6GYjzYGWvnc/4LyG
	 W/W9RxZHpDTPqfAajMLttNI/pngJb+1k2WEnzbNh6fHmXCg9s2qgiSGoAnKlMWNuJlw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=iki.fi;
	spf=pass smtp.mailfrom=iki.fi;
	dkim=pass header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=lahtoruutu header.b=qZ9vHbcn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.185.170.37
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9034F606A31C
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 08:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9034F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=lahtoruutu header.b=qZ9vHbcn
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4jP0Tc1CVbz49PxQ;
	Tue, 10 Nov 2026 10:40:20 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1794300020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=0i/3A7qiA2WWMlFT/pdOH8q3Fnxo9nhiv273V7y0MbE=;
	b=qZ9vHbcn2kiOX+EdSKLta5J3gwmX6YyrZmFmsHNKVS1f2/NEYKI+8I31s16XGs+/X6bDrt
	YNBGlAKennWblmHseNLkNsUC1Jwac1VEByw6rmwCdJxuM86EX5XEAZtDWJXArLWasVqi1C
	B9p52/0rAfbmbl2mIp0XCWTXvvEjn78oN78dK6gvW/2E141jstQt5mA3i25CcsUlObP1fi
	5y4DBXOaxDNf8V8QfUlSA2+AmksxUOdjAgCsxcclpwl5zdLVaH9VP3Tjp5Oks2J48rJkb1
	NyK48WP0iLF4nPh6pvmKTL+T6bzTiVtf70xP2bEAVC6HCqK1/Ja2eoed5eCjww==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1794300020;
	b=PmyjnQf70D9qiUTjbCG/7f+5MDp+7wNvO6z5V3gP90Ct/Paq3OX4xjqHzvOAsbw80FBQP/
	DVcsp92/rOKjsrY9APrj4QI2x4gsUApDIzeGUZcoe5V7JvbS2wONVSAEbff3nS2Pngjma2
	l0zNsqGc93JU+Y3i/ADHyqupauPMOPE8e7ke2/eDBrNjFyOfT1VauW8XpHZlIXSKjsBpgA
	pvgOiS4sPnvUvtKl++/6/evM4rs7xta4YiXQ5VDjI7d2Pz9E4q1jsTml/XUM7MyBvJBhJB
	JWCIYr34B1Wp0zxXa9U2q88WjgjLjTeKe86J6ZcMdGEkz4sO/IvOp/T+uavwbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1794300020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=0i/3A7qiA2WWMlFT/pdOH8q3Fnxo9nhiv273V7y0MbE=;
	b=mKKEN3rWp3owWxJ6dPmdj9XOA/wMx8kmnVqpgI9sxfqyb4GrofB3hRRVn+HsfiQtSQBPpj
	e54p9z7lR8mbJKBhOiK0yO4KEcK+2JjoZbu2iKeI0WDP93dnqA4oXh1/f2sxpPcH4z8JrO
	d7VQjBvbgaoo4zkdxrmj54IbU32zrIcfHLxYn/uKYlDoR/FY8BRwF7xHS0XEeHl6wjMt2G
	FA175OnzgbQE1I1KzMYa62siXS/Q7o3nqFBF5i3nT06toTFs9DvAgqkWLCjj2Ktrnk0Qdr
	k8JE36+94TMvQNDfLse0VmKiFYMSMvPvXF7sIBhjYrDUD5u4CVhl1FlewObPBQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 8F10D634C4E;
	Tue, 10 Nov 2026 10:40:17 +0200 (EET)
Date: Tue, 10 Nov 2026 10:40:17 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl
Subject: [GIT FIXES FOR 7.4] IPU6 and IVSC fixes
Message-ID: <avLYcVV33dfYO96b@valkosipuli.retiisi.eu>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

Please pull.


The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git@ssh.gitlab.freedesktop.org:linux-media/users/sailus.git tags/fixes-7.4-signed-1

for you to fetch changes up to 51b53d1de3595045243d89d24646ce1aae976290:

  media: intel/ipu6: clamp crop top offset in ipu6_isys_csi2_set_sel() (2026-11-10 10:29:12 +0200)

----------------------------------------------------------------
V4L2 fixes for 7.4
- IPU6 driver fixes
- IVSC driver fix

----------------------------------------------------------------
Arpith Alexander (2):
      media: ipu6: Check firmware is started before close
      media: ivsc: csi: Add sensor node in bound callback

Sakari Ailus (1):
      media: ipu6: Tell about not being able to obtain frame descriptor

Valerii Sokolov (2):
      media: intel/ipu6: move busy check to ipu6_isys_vidioc_s_fmt_vid_cap()
      media: intel/ipu6: clamp crop top offset in ipu6_isys_csi2_set_sel()

 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c  |  8 ++++++--
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c |  6 +++---
 drivers/media/pci/intel/ipu6/ipu6-isys.c       | 14 +++++++++++---
 drivers/media/pci/intel/ivsc/mei_csi.c         | 15 ++++++++++-----
 4 files changed, 30 insertions(+), 13 deletions(-)

-- 
Regards,

Sakari Ailus
