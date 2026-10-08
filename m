Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA472D1911
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 09:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791452608; cv=pass; b=BxrJc15Adko0kjwnFhehqTWL48r1EkbSj9mFRUz6NpsmKMwJgsFhxX6ckjOF6mhdRm9uBvL16U8zdMt/uuPCdrM4/XvVUwfiEPpfYQA9L8hdaENa8emGpAQDYmNSm/1an4KqnUm2r63T8V9nlUJ0talE/Kk1IPuXaW4IrZEQ420=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791452608; c=relaxed/simple;
	bh=fGwYUE9oTAMFbIguJ/w51aBTa6pdRqRz4NeP/GV3Rnw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ruDhat5maU7cgGlIA0KRz285lwgv+0C5DivNoRfKQiW8CkGDIRIsY9BzbQ8r/Du9LWorXZML8iDV0Axc/CT7q7nh8+8PpBSG4eXLJBt0NdY2aFmPejt3bYqhVDB7aWocUO6Z0FuqF7v7kiFmZMGpXMH58bgpVlMDBYutAfuGfZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=pCLFqLO2; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="pCLFqLO2"
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4j0lRQ1Gkhz49Pxl;
	Thu, 08 Oct 2026 12:43:14 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1791452594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=IUvTo57P9ZNAmjTy6eK3Gbxt+D+M1faMx2ZpCPrLpyk=;
	b=pCLFqLO2AuzAu/oanMIX2oz5gT1+u0TaLdPXa68Eh0WM1AKDoNRcs5Q1gEyWv25NkIRGC6
	BOGKFA8LH9w7sby4udN5CujJND4Irc+Dh/Ea2mObvaCPoEwzY8W8QlL+85wxRiZeXnz0w5
	X75+pxDkpxfgr/Z2S22YYu7sCeJ+r11vX09rBuzzMdz9orOSjG30AntRpJZ4udHYfwgfvt
	P2Sv4ikoIXk+DY7nj7PC8rCRM1SgAvd0i//wK9EGRmrdNwm0/ePjRA2YMzesIVofDvo8EO
	uLQwCNmiO8fbalidSwrFx75wlPsPyhY22gzwsHmjrhX0NlLdvcSQIDaXotRfRw==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1791452594;
	b=W+2WJcl7F1Nsd+DfnLgPYgPEEujB9ahnxvL+0wvFUrN47oWSPXb3NLF6rZA+ji1opwjQNl
	ULLxxajUPNHi5FK0HQ5+g+DvYiq1pDDfPCV4kKfV9UxrCvxfHV4PI6awGBLclMkPte943e
	el3qB61aPrifTRzdhR5NuYXNK2NVIvP8pQpldSzHa2uWKSL7gxnwBObSv5OQGOLHeMgNxE
	xan5oUrTfmWLhcize8USFoqGziVMNiSjC8ZFUd7vIIj0xT6/cbArNjvYxf0/ivRvtF+EpP
	ISSl9AzBBOCHGaZMswPtovi/n3+tAP5TcG6HuP/Pg/AG2bECwzAQSeWBDuS8SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1791452594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=IUvTo57P9ZNAmjTy6eK3Gbxt+D+M1faMx2ZpCPrLpyk=;
	b=IUq57KA5i6ILLBgB5iGnZEwGbcTKIKY0C+BLsHvWXvq0VuZqcrEWrYsLmZF6sfuvD6zYL9
	iahmXg4aArqBCaH9r+TqGlfSrYNy71hSzCe256JelJelb2A42J8uw2BOdNoqE7NsPlZiui
	fjmhqOZ9njgSwbgb0RU5nMOUf7e/ffDQr/AC6h8xrzj7zqEG0+K0aET2x57qezDa8Z4Tsw
	H3bh/MsbCuuAg+ZkHsAqfGeyY20ISVN8VOWkUs0KSjRy7Hpdaf7DgzbCYWDOxpi1Ah2VtA
	FsfRZ9jnusmnXsermE0ZpgfLAvlCqAUi9lA6n6WXwKopc6FvHVKxN4n65D2JpQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id D934A634C4E;
	Thu, 08 Oct 2026 12:43:12 +0300 (EEST)
Date: Thu, 8 Oct 2026 12:43:12 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl
Subject: [GIT FIXES FOR 7.4] V4L2 fixes for 7.4
Message-ID: <asdlsMac7eALgvgY@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

Here are a few fixes for 7.4.

Please pull.


The following changes since commit ee2e9bf41d3e78b85486986cb861305576c6fe21:

  media: i2c: add imx576 image sensor driver (2026-10-05 15:02:11 +0300)

are available in the Git repository at:

  git@ssh.gitlab.freedesktop.org:linux-media/users/sailus.git tags/fixes-7.4-1

for you to fetch changes up to b51ccff3fa570c1f15cfeb67822fcc1dfef83671:

  media: i2c: imx576: select VIDEO_CCS_PLL to repair build error (2026-10-07 12:22:42 +0300)

----------------------------------------------------------------
V4L2 fixes for 7.4:
- Documentation fix in referencing glossary term
- imx576 Kconfig dependency fix

----------------------------------------------------------------
Randy Dunlap (1):
      media: i2c: imx576: select VIDEO_CCS_PLL to repair build error

Sakari Ailus (1):
      media: Documentation: mc: Fix Stream reference

 Documentation/userspace-api/media/mediactl/media-types.rst | 3 +--
 drivers/media/i2c/Kconfig                                  | 1 +
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
Regards,

Sakari Ailus
