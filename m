Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924C93BED4F;
	Mon, 30 Mar 2026 10:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865516; cv=none; b=e9JDF9Zs/dcnWjNEUt2UFD/P5gHPZKA8EKFSvtAz6cNegvvXNe/5JpfjRgOFOnAeRw2tv2kYhPauPkL7cgrA3LHFvI72gXuxQZIxeO6CpAN+ytj5+JNeuO9VSJq6wRElnGzsWAzqepazqGANSI1zOQujyZQqBpg/x3XI+hYUVOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865516; c=relaxed/simple;
	bh=FNOjVpC7pxIwyyspaeMj1daQCxWmYFjZ5zGk8gEFpV8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ny5IKPF5zMyYYyd3zCOFTyb72XMVYZHCOMgprrNwKhQuNbppa+iL/lAuWD97ddaMcwLPKt49Xt0tMlSg48puuzXGsDYsNN4tA1jjcy6OL8pkcYvS+4E7hLzuIzltZHSHPrGVZ61EPWWgdSmM8phEyYO9FUfc+Hiy826HSSGmIL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G4ZqA8sB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G4ZqA8sB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67747C2BCB1;
	Mon, 30 Mar 2026 10:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774865516;
	bh=FNOjVpC7pxIwyyspaeMj1daQCxWmYFjZ5zGk8gEFpV8=;
	h=From:To:Cc:Subject:Date:From;
	b=G4ZqA8sBEaUxXlNw7sFZmImJUblPFHQOFjSAhYZYfKLNGLDGZV6N9iwoh16v29O1Q
	 x+wUVcJIQZkkBvyO/NpbN1lhrpLlRJSuDdFzCNY/nKSBHrSRppKEjYmHHAjIFG6g4R
	 kYYGA0KXue/SQQRanQtr/81bAxMPhg9Oil1VQH1wglPpfE/U+p/v/s9A2uOVewjEIn
	 qnTcy+DLSyFYVBKqEsKm80ETH4zqKrzwQiiFKfH54iGT/PMg9nXnwu9FclV3n5+oV6
	 oiqKZJeyZF6sv3in4UrrpBLIu1uVKc7v5t/nfmf4pglmY3h0OWM5bp2POD15gJI+7W
	 fVCsUeTGbJugg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w79b8-00000006yva-1Evj;
	Mon, 30 Mar 2026 12:11:54 +0200
From: Johan Hovold <johan@kernel.org>
To: Hans Verkuil <hverkuil@kernel.org>,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/6] media: refactor USB endpoint lookups
Date: Mon, 30 Mar 2026 12:11:35 +0200
Message-ID: <20260330101141.1664143-1-johan@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the common USB helpers for looking up bulk and interrupt endpoints
instead of open coding.

Johan


Johan Hovold (6):
  media: si470x-usb: refactor endpoint lookup
  media: imon_raw: refactor endpoint lookup
  media: irtoy: refactor endpoint lookup
  media: gspca: refactor endpoint lookup
  media: hdpvr: refactor endpoint lookup
  media: s2255: refactor endpoint lookup

 drivers/media/radio/si470x/radio-si470x-usb.c | 11 +++-----
 drivers/media/rc/imon_raw.c                   | 18 +++----------
 drivers/media/rc/ir_toy.c                     | 23 +++++-----------
 drivers/media/usb/gspca/gspca.c               | 17 +++++-------
 drivers/media/usb/hdpvr/hdpvr-core.c          | 26 ++++++-------------
 drivers/media/usb/s2255/s2255drv.c            | 12 +++------
 6 files changed, 31 insertions(+), 76 deletions(-)

-- 
2.52.0

