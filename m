Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C2C126BF1;
	Sun, 19 Jul 2026 16:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784478401; cv=none; b=JhYdRzmxMlV0XC2yeti7dyqKgRw5xXYcTR+cU60a/qzhRIYUhT6tSDvWFqOsQzqVJ3ceEvxqdE8QknoFznFnY7se+XoIRKk2m42QuuFDSJv8o1wWAbcCwoE+gN87yOiWZYVD2x1I4/kxaKNyGDIy8QmeXn2GadHnsT6FJ4PrZ/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784478401; c=relaxed/simple;
	bh=V2rF2CQqPH+D4hQ4XpJPDeqT9yCsUr1piiY3Kbyp4a8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iSyZmps3MqKyqSGKFs11XwEaHdWjT5pYJqxT9Cbfts/+AewyTNQZu4z26E7B8rvGc4KcTKdzSTObmC+5FDJfCM/mRVz1eZoP5aKshlqGSDK119uAiLuufJ/Tt9i7bokOJxTssp19SwzZdg8GiauzqY07+NO7JsI7lwW9uLhb3MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=berg.pm; spf=pass smtp.mailfrom=berg.pm; dkim=pass (2048-bit key) header.d=berg.pm header.i=@berg.pm header.b=r2gwROwQ; arc=none smtp.client-ip=79.135.106.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=berg.pm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berg.pm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berg.pm header.i=@berg.pm header.b="r2gwROwQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=berg.pm;
	s=protonmail; t=1784478390; x=1784737590;
	bh=MiibsyNFbn3Jb6JMsVLC6gKW3hB6R6o/acdgnLo9Eic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=r2gwROwQOSJnxQfhEf79uHD0sguhHdXfgJwHk0kbYsYdjOD/tMkKk+AQqRHlhxTfC
	 EsXHMSHrhzecqxlmJwlCoElbuRgv0Be9VzAVLrMr+uloxWaHRTU6MogmhHAXJ1Olzp
	 lG3VHh9oRAsNY1uCnbC8d6f7nUGlvMBMyI5jfjfEMhCU6oMSlFIq7rtD0EgRQ42haB
	 IUGuK0ykKtwOqF5wfrdS5PJEV7PHEoYL0W0tMzO6n5yI3aAaWdPggYlAUUnddaUcuX
	 PAihCl1y6+r4ynsMBLTRd9gJDyEGdIa2JRhYq5Frb3Ptj74Du47lnuDmlR7jv6Yq2p
	 RNDWO/AyfXpcw==
X-Pm-Submission-Id: 4h38D14qYjz1DDLW
From: Jakob Berg Jespersen <dev@berg.pm>
To: fernandorimoli11@gmail.com
Cc: dan.scally@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	naeemarsalan@gmail.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jakob Berg Jespersen <dev@berg.pm>
Subject: Re: [PATCH v2 3/3] media: i2c: ov5693: Gate the MIPI clock lane for IPU6
Date: Sun, 19 Jul 2026 18:25:16 +0200
Message-ID: <20260719162516.21384-1-dev@berg.pm>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260717132021.18034-4-fernandorimoli11@gmail.com>
References: <20260717132021.18034-4-fernandorimoli11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 17 Jul 2026, Fernando Rimoli wrote:
> The ov5693 never programs MIPI_CTRL00 (0x4800), leaving it at its 0x00
> power-on default (free-running MIPI clock). The IPU3 CSI-2 receiver
> tolerates this, but the IPU6 receiver [...] fails to lock onto the
> link, so the sensor streams but capture times out [...]

Confirmed on the Microsoft Surface Pro 7+ (Tiger Lake IPU6). 
Its front ov5693 enumerates as INT33BE, so just patch 3 seems relevant. 
With the unpatched driver, only 1/20 cold opens delivered frames, 
the rest timed out with zero frames. With this patch applied, 20/20 
streamed at ~28-29 fps. 

Tested-by: Jakob Berg Jespersen <dev@berg.pm>

(Surface Pro 7+, Fedora 44, kernel 7.0.12-200.fc44.x86_64; libcamera
cam tool.)
