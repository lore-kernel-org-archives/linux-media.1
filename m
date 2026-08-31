Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5907B483807
	for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 14:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788184991; cv=none; b=USt8RkAdCU81Lwbh47mtsdbeW9WBpjlH1VbO5KHeTuhnPELvsACrEWmkS5RX/HdSjS2+/nVTOkfP3FkormC8qa90vdp/LbxWrGPeBc9Hgvl/7JhRyXNPXKSDE1Lgk5lmGfW5rQ9fRS/gVzxzdr08rsCtdMmqYyDYAaH2n3nEcX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788184991; c=relaxed/simple;
	bh=uBRstAJdzOQ6fCXenmU9zLfDCyFOq7Yo1hdroUnVRwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O3umh8RAru9U07lDNchWvysfgv1UnbxD/Acs8uaLpDwy/NtVg7m556el4dG/ZIQgkd+fmWBq3GiUc7xLz1ODhMg1AjZzZiKKL8Cjis3jrRt4KH2m0jWhkEt0CQg+hpZTjiZgyeOLYy40AxSEaOrCl5sd2b4rSiRAkEqxWG3mgcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PlId7v5X; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PlId7v5X"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49954b88fffso24336135e9.0
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 07:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788184988; x=1788789788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rjSPBLWPdLhA0verlG4+qAuqvJiAKOz1NhqEAjoTdrA=;
        b=PlId7v5X25NxUwNZhHozDEs/LKgChXZrsR9iC67y4eIHDrdtIpdVgk6uHRd2x0v9k9
         rvShPjGzIkG8yZQIYp5JT3DiBYnUlRowjY8/2eWAKLcvKxNMGIiWroXY4l1oiMAGlb6T
         u0mMg6IpEwpW5D5tg+fdEZFuzRDfm8d7UhB6fH0J8HOHS4Drgz+rOc3vVp48zHboUKBs
         oFBDnSx1V/MJijQm7W0L/f5tvdVV1Oofq/785LkGit9dAktYQIa59UUzQ8YbGw0adDBY
         STXKBrNBOHZfBjLgJtF12FSbWZmTNZ+RVxmrOghnyfwICwlLgE0s2A1ggqcit3iElDRu
         4yCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788184988; x=1788789788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rjSPBLWPdLhA0verlG4+qAuqvJiAKOz1NhqEAjoTdrA=;
        b=LWySTxfoGYL2iIDmxvsjfnhQipJ3uZDBInL367zLUYNQxNBr8PGl0V+8rw9TvvDTaz
         00BSz6bwHEXnEmYIfZrmQStX/tkX7HqC+j0UEGaBRkPOHUk92+8dS3jf0SVK80PvyRX1
         WWCtTUlk/9Oo69ol46E3RwQmVWSycsXWh8l571q1xNwPv7RPlkNwqVQsoG2bsOCjNZLc
         TA+dHl25qTtrA6WrIutPo0tT2AQJSL+WwUPUdKyEqYu+v5D1Z7aVHapxDfwT+CV6juSu
         8BwPLa0NmTwxNQQLiLUnmCNVz0tbGrQBEEEqZZd62eQt6Df1qO/g7SP76IVhpbN/OmTz
         dU+A==
X-Forwarded-Encrypted: i=1; AHgh+RrWki1PCki4hZ58NDyo/kSce1yphw/8nAxUZg1JXMAZEv0w/gSw1U3VYkOMYPQTClcSmhACZY0GH0wiLg==@vger.kernel.org
X-Gm-Message-State: AFuF++kMAd11Fk+HxPq2RyQUxHlz5V5+M+Cpa2x/Ikp9NUlD2bM83O1X
	KXCx858LXw531OsuWIoCAMONcKeWQjNRZTIrNkTY+70DdsoVymx/7ow=
X-Gm-Gg: AR+sD11hxEi2lskLPaafhFnzP4Kpk8KWOKS2gyEuN8PHOvA6qoMWFq2oT9IPrVy+lKJ
	oEdA5XfRv4JlW4YMI7xHa40aWrVZgAU0hRfLyHAlfi0Jjl34EZeL01PpakI0UHlIgR1QO+glSAI
	ocQVbznFDH+yC0DRv/bfCkJ2uJXnmwAR43XPH7RS6uRQ30gSuDrYRQGn0EudFX0eLa9IQ8rVyXS
	PjZcBvsFasqSI/TXTmo9MHTwBelbItv/xVqPxtCjf6codgwcJQjtxT25zjJKPBf2JWI5i+5ebW5
	w0lhdT26dVTFYVYiVRN3pzC8haiTA0uvZvADlL++a5t0IScDt1pXM8In1AqSwiX14A6RJsXNs3S
	8XRithDpniilDxJ9TBmZywbHqBJgnKc+o9lQxt36AbbPgcqvPhlT7jH++THZ45ihHRB/9aE9FZn
	jOc6V2ganB/FSDsWit4KqGJ6XXHNLnxfLY3JuEfkz46HGxonSnIC1+wxwsQDG3LtGdK6mjrgbtS
	FY91hmXesvp3KWx9k8q9T4k0WnbKWBDZ8raPHOgRbdxvdP2TFmsw7Q=
X-Received: by 2002:a05:600c:4e8d:b0:49c:dada:f581 with SMTP id 5b1f17b1804b1-49cdadaf6c7mr15081095e9.0.1788184987289;
        Mon, 31 Aug 2026 07:03:07 -0700 (PDT)
Received: from surface.. (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cca3e642dsm173851415e9.2.2026.08.31.07.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:03:06 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Daniel Scally <dan.scally@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"D . Manresa" <dmanresa@gmail.com>
Subject: [PATCH v2 0/2] media: ipu-bridge: survive module unload and reuse the software nodes on rebind
Date: Mon, 31 Aug 2026 16:03:01 +0200
Message-ID: <20260831140304.45940-1-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831094257.29398-1-dmanresa@gmail.com>
References: <20260831094257.29398-1-dmanresa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

v2 of the ipu-bridge rebind series, addressing Sakari's review of v2/2:

- shortened the 2/2 commit message (dropped the cross-reference to 1/2
  and the IVSC/VCM elaboration);
- dev_info() -> dev_dbg() on the reuse path;
- replaced the free-text AI note with the Assisted-by: tag per
  Documentation/process/coding-assistants.rst, in both patches.

No code changes other than the log level. The v1 testing stands: on a
Surface Pro 7+ (IPU6, OV5693 + OV8865 + OV7251) the PCI remove ->
module unload -> rescan -> modprobe sequence, fatal today (-EEXIST),
completes cleanly with the series - twice in a row - with all three
cameras streaming after each rebind. (The same sequence with all sensor
sub-device drivers unbound first fails identically without the series,
as reported in the parent thread.)

Thanks,
D. Manresa

D. Manresa (2):
  media: ipu-bridge: don't reference the module image from software
    nodes
  media: ipu-bridge: reuse the software nodes on rebind

 drivers/media/pci/intel/ipu-bridge.c | 38 ++++++++++++++++++++++++++---
 include/media/ipu-bridge.h           |  9 +++++++++
 2 files changed, 44 insertions(+), 3 deletions(-)

--
2.43.0
