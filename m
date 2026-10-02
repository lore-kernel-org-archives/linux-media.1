Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CA947CC89
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 09:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932696; cv=none; b=LWpDE5FiVuw9EJH4q62HNwUcHzPbmtNlhmVhYE5YynzxLIaE/mvngCXVOG5ZDR3/rJTMjcTGQsEQYTn9u1JsKXqClo2bFoo6ff8TEWf7XH5Ope3Svga+XrXsQPoCraj9s28u7Q3ezGqDlY5cRZJ/zIy0gmMyfECl8gQHYDQMONw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932696; c=relaxed/simple;
	bh=FTaeuMBL/kHKwhk5uksXNF1j/IbmPOC4gCAtqsaIJ4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oD5LWeh46lgLbKMmw25M58mMiFyU3FKaOGgJow52m5iQ2mm9umkpmFPqZeo86SzDtbTphI9P+VEBAJSLHoFMJNIZertXxePJ9C/W5iruPnelpj1GciQ5d0k0auOF31nIrdPQU4zeZGdnXJ98Q32GcVM5te2P2j2+1IOdL8skmeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rMN9BdM7; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rMN9BdM7"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4834977ae75so4620324f8f.3
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 02:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932693; x=1791537493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FTaeuMBL/kHKwhk5uksXNF1j/IbmPOC4gCAtqsaIJ4A=;
        b=rMN9BdM7KdbmMwHqGrmxlu5iz2YeuIgQfxYQa7psz5jGLlEbI3iXPIU+8oHJpBrI+a
         MgS4dYsPtt8epbg683Tt8l4WDWz5uhXoXKdVwxnsLAauLWG35Yb68UiAGU3n2KVG4vI5
         lGMqxaejpaJ9281VBJYcsyYNPQ7acMyskFgnQ/w/5FCpH9HwnVaIEMKZmQWnm+gk6zxC
         YPR4qLcsQcwiyDMIv1yKrAqj6XXIcBkfkVFxsCc5YWTpgg5GbW9Pr5WChn+pUiVTSSQb
         ZRFrFn0fPvoJOnPExAzrRn8mb6QxIjh3cCvh5oka06aQXv4T13R0fqbnw4eRz+xyin2w
         hctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932693; x=1791537493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FTaeuMBL/kHKwhk5uksXNF1j/IbmPOC4gCAtqsaIJ4A=;
        b=ktaWbVr1PEDE4h0OiN8Kntx92n7sawJzUMUJ2c6XOr/sDuq1ypKe9/aXENLIWFIW9v
         Q2V2xskv3JH5Ye3FCsVsboefIq5hg9PPEbPzJklRZ1jDTp4uU+W6uX7ZPfhO1SGhPaqj
         8XSV+Upeq6V/1Gg49Bs3+MXW1bSAmDrR+4VtiBAXPrUCwGE11zGLyOQAKKnfsUoNf0WT
         /ik4uQRszHjiTHf0nKFefFhldLMLhwI1mwIn8IOd5YsgIx2kF03vvXAtzLgCHcPNxKsF
         uk8xKagHWdlN+509/nWvdyRo74OkPIU3yxhAZdtMJ10Xmt6Lhz6TfO2OBu6KFx/Nb6D2
         wRmA==
X-Forwarded-Encrypted: i=1; AKwUvByWshJdhBPcQGyduV+PIDfY8Wa4mmF0woww1YpDzVoUSRi2MQfeivtntW6Kqeyg7inLCsFZBEASXVp/GQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKro8cDVfpoJqNNlQCC6CQKnDZ5oHHapPBjgsoAQyS6hbQlVuCN
	LoBHBkUSz0IIpZgBW7ymiFejTTzx7I9sYpk0mFjeHnDkP8U42iQ407fV
X-Gm-Gg: AYBFou25CNtb1k5KUQiv0M5+mpfTHyhDhBrMCON+vw+IsratIiq6UlOtyuCDJzKF5gB
	qIcE8QEr7ewx7VWR3D3wTNBXmE96ta+AM7+hSsoHJYtplPB9kGi81e3dNhAQ8bfksTPbCbHcPsW
	kvgNQkP97gps/lkDzFAkmvB4r4aDn2J2u5Iq/OhjrC1g8yzA1M9TFm/PxIqS+JNWQyGNFxefUyP
	ScK4BOEpzXfs4x3T60ceH5YpazB1bntICToFhAc44JVjHCncfRC2fnzzYLuHMyaC0m2jXTHzCDw
	VYmvGJvmB/mUkCPjsUscWx9ea1YWJqCeU8UTVDLSHZEawpfdek6jAQ9wZQ4g4mrje+090xjamd4
	0ENCHsHhr5QpAxtqyPB18VgcGa6DtBWKd/JR3JmyUGyTMhB1IKBCqAb/rv/VzhMOvUREeRjUOsA
	/dig6/aHk6Fr57QZ3xFhX3jYrx8Z1IrhOuJFx6j+2g3HbtahNCQz/sQfwIKWVXpw9NHvrpepFr2
	aWZDvKLNz4bj/B8DRUrrKSyYMsVN4DSO6OtQtCmT4B7s1n64RjeKjR4Lgk=
X-Received: by 2002:a05:6000:4112:b0:48a:f02e:1d23 with SMTP id ffacd0b85a97d-48b12741316mr3374960f8f.23.1790932692892;
        Fri, 02 Oct 2026 02:18:12 -0700 (PDT)
Received: from 1Z10 ([2a02:b123:8010:a99a:44ac:6cdb:a419:601e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f98ffsm4465019f8f.38.2026.10.02.02.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:18:12 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 09/16] media: intel: ipu-bridge: allow sensor-specific link frequencies
Date: Fri,  2 Oct 2026 11:18:10 +0200
Message-ID: <20261002-media-v7-p09-sakari-reply-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ar68mkS8_qRdGJQr@kekkonen.localdomain>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com> <dd8bcb40575bfcb11e92d976bec7f2b26cb95ca5.1788360629.git.mauriziocasciano7@gmail.com> <ar68mkS8_qRdGJQr@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Yes. I changed this in v10 patch 9 to use the existing IPU PCI-device
matching mechanism.

The patch adds an IPU_SENSOR_CONFIG_MATCH_FL() OVTI2740 entry for AtomISP
PCI ID 0x22b8 with a 288 MHz link frequency, before the generic OVTI2740
360 MHz fallback. The separate per-sensor override and its hand-off patch
were removed.

With Best Regards,
Maurizio Casciano
