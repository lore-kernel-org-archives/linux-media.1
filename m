Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794781114;
	b=rPjeUdFJsUnb9+m4jpKa72ar/JIY1lylJUGb/PbJqCFaPzYhJNbJR3GtH9ZOX4vVTtOc
	 WShzVPtISre6sap9LErarBR3mF41Si4gfg5sMKHx5m7oDzE1ITP2SU4IJ/Y2dphGvJGHF
	 JphOOeoOqtmBn8Yg/5Nyn1QD0rdXKMnPOkC1kNyc2/wRbYkbdqKG74dGPdb0Toe6mR48N
	 iI4tcG67O5B91MPd7tA3AevwOAHZKYvTzFoh/Qn6660+vJM+6WjEIlvOkpnDq4WzSQQeY
	 YLxr4KuK56QKXSNtyi2K2iu6LjIdrV7VcysZZEURqhtxXCfiGD9wtwuiBqSgaoGr5SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794781114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MpshBwpP8nrcyZIgCaEpwnlsFopChh0GnbxP5EKQpwM=;
	b=GTAgAdt1io5ntyD2wFpfC+7Dt4YLbcHHLwFoSl6tk6ql4hr5wEpeDbmtsgS2aJfGFXEE
	 Z6GvJsP39wHUSMhzf6MmVMLDl3F2KVBvgMfZ0bK1y4ODtk8v3QI1Tlx7SMFoxPgjhmgar
	 yVgQQ4ef55fBl1RPpEXA36nZ1HrWpOFiQbhuN4n4gBbZ7O2pd6NCag0Bf4WVaPjX4O56V
	 c33XcHe15dq1emhMqq6iW7WipMMcx0hRx52O+5sFkheRlGrWYhZ8jJvi2JGtIwaAPSnl/
	 5gFj/4xJnJw50pqrUCLP3DzRDWfSGSowuJQJrFp8zYzx+KspB/dxVUGuq45UoxA/VgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hl12hccU;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80766606A329
	for <linux-media@vger.kernel.org>; Sun, 15 Nov 2026 22:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80766606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hl12hccU
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36ca32a0faeso293814eec.1
        for <linux-media@vger.kernel.org>; Sun, 15 Nov 2026 14:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794781112; x=1795385912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MpshBwpP8nrcyZIgCaEpwnlsFopChh0GnbxP5EKQpwM=;
        b=hl12hccUVxYDW0zF3xMwx12XdbjOy1q+DGTYEWZSnlgIWtx+BujqEXwWaVXtzPlegq
         bBhJ4ocHjqdY3Ke1M7V2xqG8xCocseWx1EiWPoJ7sx83k/LSezEAltYKQ2leyxJYC/U7
         8jgtz7kNV564uccTFQ3bZAJX8EEpj8bfIGtd0Y3b1gENQeeVYnb+a/E5ZlsYd/4adn/5
         zajP+pg/4c0hSzmG0evdfN+0Dgj4U9iDdjJv3BmY9uBBPnkI2JpbHEq2NqtSOWhdJhmd
         o+fpnFU9sJ7PJn9kP6s2y/ChrCbF9BWlRCaArArgdZfY/PR0zy63hhmxZcks7dunZGaJ
         ybJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794781112; x=1795385912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MpshBwpP8nrcyZIgCaEpwnlsFopChh0GnbxP5EKQpwM=;
        b=oSxQdlBXB37jsI1MC71YUuGIe2Subt9uTZy72a6NXKI+eSsYF1KfGuSwaQctENKjqL
         Ky9ZhTiNQ6Ow3K4HKBCGIIvjn9E3OMoETXSInVG0qU88CWsRDbxZgWkWgSj01onFCsDg
         FQCv5Q3bnWVAY0q2LGdmN3ahc8Q86JcXhboyRA1cmaHvp+ZHF2hZjUqanZGAU+ZFAKln
         3Mthm40tunBHRtupY1DuSgRBMdWbMOxsC0vHUVc0OOa0oz0Hzz+bZCgv8Kw/+KdPtGQ7
         krCp+kH6Hig4Y1g5hcm//pCGu9MC8KA5TyPgBjrBINVJJbMNT97aum/Xp0vU+EG/4avx
         5y6w==
X-Gm-Message-State: APuU4Z9trCbmpH/70Nac9tL99SuKxXb0NNyXxwMeZa2u5IfPoBl6eiWQ
	L+961m89YIx2RCn/e/BD2QInkw7BAHmylNByrPGsy+uaW0MX8OaGXANf
X-Gm-Gg: AYBFou3NLFgpzN3yRPnoEU7MWqbHJ+KrUbjfMSHwooA8VWEoi0B9zPRvnyWgyODWq6K
	WcUx3dvODCKmT92rStul9JXYreFhgNuv7aih+bK8YNRDxeqcnVeJNpAJZhSSxEdiQ0UiSfNprrT
	Imq7vFV+hr/f81j8OOZcEulSTEYGi8nPBO6XjLgXxmWluaAwRoZZdYr2lFuhZu1572/3X3f0RqE
	9/9pvMHekgmYGmOoG0K/WD1G9jh7klpQDErapu/hK6sgCfxkqV/lfDBx8tqU81F00V84cMEiHRz
	k3M1vKiNAIkm57WVTPcKxmvnXN07lCPAwxc8B7Q8dZF53ZLZ0polOYb+RH+CTkm0H2IanycT8aV
	WH/nguzHXxGKUNYDVfb49sSkL4dz4/WHqOHT+jN+t5xSnHHdP2fJDQGGLloCDzvb+fWZS/WW+gt
	Fil4CyD2X4tBk0WOVeSZtEhGYfGO9/eGKXssvs3/dC+0fgwwcsgmO81tm2n5kcjjNd3wzHin3ZQ
	boTePMOaaD59mpbZ5Aom754IhIo71/X6GLHxiGqn6W2l3lxMWWegL7zqV6tK4z3V+97+SNK9zPL
	UD9/6Lz52z4/vwKiMt/JT/gsMrTA5qr28KTzYgSdDX4EOP3RfL1WndsweLOjryaifo5MrP4I8K+
	kc4OcA6I6BShQYKXdRuPAHaSmcnCMWyBopgoPl9wOnjg8EnUCfTna6tPgvgd+4CzyyPBE8btqBI
	gTGV/G8DbUbzVjDmzuUL2EbnSRri505OrX
X-Received: by 2002:a05:7301:a0a:b0:36c:a1bc:6114 with SMTP id 5a478bee46e88-3796038259fmr12826511eec.0.1794781112527;
        Sun, 15 Nov 2026 14:18:32 -0800 (PST)
Received: from esteban.tail1178e6.ts.net ([240b:c020:610:7dd7::e91])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3797f98b9b2sm26765616eec.6.2026.11.15.14.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 14:18:32 -0800 (PST)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: firassharary3@gmail.com
Cc: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	dan.scally@ideasonboard.com,
	djrscally@gmail.com,
	dmanresa@gmail.com,
	dave.stevenson@raspberrypi.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/9] media: i2c: ov7251: fixes and infrared strobe for Surface Book 2
Date: Mon, 16 Nov 2026 07:18:21 +0900
Message-ID: <20261115221821.2928690-1-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115175301.8516-1-firassharary3@gmail.com>
References: <20261113024059.1087031-1-antoine.pichot@gmail.com> <20261115175301.8516-1-firassharary3@gmail.com>
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

Hi Firas,

On Sat, Nov 15, 2026 at 05:53:01PM +0000, Firas Sharary wrote:
> Tested-by: Firas Sharary <firassharary3@gmail.com> # Surface Pro 7+

Thanks for the test, I'm glad it works as expected.

Thanks,
Antoine
