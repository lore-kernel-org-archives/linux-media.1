Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25A63D6478
	for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 09:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169382; cv=none; b=cXCoE4S3WzSog9066x0jWfRfXmyVluUKNspI7ypNQR45qIUZKrSHg/hpWnkE93CgwxE+3gK6gku+3c6tZ2N+x5rvIL3Aw4zfBLRSsSSH27URUepz6bk26L4wfAynRaJPoqDOkDCkyhCzMBthFPIMxFbDv5Re8Ib1ky522lw0Vbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169382; c=relaxed/simple;
	bh=35EzNSiyIJM0rUsF0OTB32RURb3cyx+dqalmsHb30nI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ADKHCAoarTovYMo7WfHLfVMeHoVBmRCHC3M9R2nbE//mAQ9LNxQTMEpaDbgsabETts0RK6ymtbiHCbd2Y2UzEB+MTSsp04iihWG3T7+BEI1XCmlZfplSPwHgAbCeG1zEzV2XMgtYykaVq+zR/RZBmunCvFCFcrZoBMnNnt0zwg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WPpvirOI; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WPpvirOI"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso13645375e9.3
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 02:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788169379; x=1788774179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/IEQQFZpt+fjMQrqj3CrqGs9eNFWFgq4bp+ldOqXtzw=;
        b=WPpvirOIsRSBJgWcyiakQxQp2jc9FbPcSV9OgMm+Gt/lUpoLsedy6e2Wr0itGRmX6H
         Qt56eZQ7hQXFOhtQCKUNn2WrnWKh7wNPy+D6uRhel32k6nM65+Wn+3IexdT+lXF87CLb
         XMuYmcZ6Ldo7OJtEfL4ibi5vPkLbKdVoL+knt/lvDEBlp/XfZvAx8tWA057dkRDsXQlG
         UavmnhsLjueQEWmEb5vXqRvn6tgm1CZTiCmrZ+oy5LXrSQgbvBGg6Pixd20whuh3o0Wu
         At2cbnVjUywPjJMSIruXFwhWWPJLE8ac0rO98r527dW5Ym8LqHCpTWWuuAreCY+bRKHU
         a4mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788169379; x=1788774179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/IEQQFZpt+fjMQrqj3CrqGs9eNFWFgq4bp+ldOqXtzw=;
        b=l2hEGlAMng6AeEFpJW9ASb+SkFCwaLdiXD3lVefgRWZLUJzBaiHM+kEqcoQ3JXVFGq
         49+9wj0DEQUpXW0YCiBU4R11SeChprIgnDaOaSYThpbt5rc6Z0wddfWpcmAEfzMehPfc
         ypa5FSnwGqlerL6/VqkGuKNeKnoJnPKePBuxj99iqBLxEqzuZBzHEdaprqjpyVorokXC
         t8pOJokHE+AzqX+IM212ptYYRY7PE86FduycdyTbx/ywB2tkW+8+kw5ppsSG533nVv/3
         TAoANs+vdDTiJVWSlEoy8oo2rYZdFhKCgJ87N9EYp1V5oxrQjdJh/k90PM5ZPRjOIubq
         GzDA==
X-Forwarded-Encrypted: i=1; AHgh+RqyOUhwrx33nuqF812rwnBEugKegrdODILk1mNKGB0on+jWOlWLpm2nzl1iXOLA4ste4lyW+CET2pxjMw==@vger.kernel.org
X-Gm-Message-State: AFuF++k2IMEXNoEO9y8lify4hMkKIFqytnhJu+EB40LvYoZzT6vsrScq
	mastLV9co3gmN6Jp50JQnTSuYg9m9pinipyhkGMZkCpWmRH70gEaxjg=
X-Gm-Gg: AR+sD12wwmNOLFJhv0mvV+bW42a9gKPVmkrGZK7gdy4yVG9sGJEZkbD8mMKdN8dF+VV
	BXXkBP6sREDMKpRGlddbT4SnURwITnfSvHA51OlzrxHdhEB+TwuyEu11KYjsTx+A67jFniBgspF
	EauSl+VaZ6/agHS50bbzCczSGzNP8tPxygVFwPaz26XYR0pXZu3Zghq6JBQvQ+34bCjScpn1SgN
	8y2kum0Jizj9la8cwFfgtKSLD4d837f0oL08Rl+8SU3actjYKWCgV3sE5F5a1c4iTB8iBzHQq6f
	d3iiycAcW5iCW5TPmFEGiEnvsQWG1gZmRSQ9BM0N2ugATC3jDmyoQ0sLWGLttcWSJ1bGYcXDuz7
	pAZW67n1p4zrRczmDDxel77C5ymdjCZ3ChXMAyZMMKb/8cNL3xfTj2dtDtNdNFIvdyU3tAr7ZaA
	BCZcXGuBd8VEShSwb6+15mByUFBe2kxp9wd4ndfKlgDCs3z8TxcLm+BqHZmexnF2GOO16nJ69sd
	UhPjAA0qjEf4K7EEyi1OiWbpSVLGplTsXFagF3DICMX
X-Received: by 2002:a05:600c:c494:b0:499:8aff:59b6 with SMTP id 5b1f17b1804b1-49b91c486c3mr302718895e9.14.1788169378725;
        Mon, 31 Aug 2026 02:42:58 -0700 (PDT)
Received: from surface.. (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9267c369sm189932125e9.3.2026.08.31.02.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:42:58 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Daniel Scally <dan.scally@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"D . Manresa" <dmanresa@gmail.com>
Subject: [PATCH 0/2] media: ipu-bridge: survive module unload and reuse the software nodes on rebind
Date: Mon, 31 Aug 2026 11:42:54 +0200
Message-ID: <20260831094257.29398-1-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827232636.93145-1-dmanresa@gmail.com>
References: <20260827232636.93145-1-dmanresa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This implements what was agreed in the "ipu-bridge: software nodes are
never unregistered" thread [1]: the software nodes are deliberately
leaked and cannot be removed (circular remote-endpoint references), so
instead of a teardown, make the two halves of the intended design work -
the nodes must actually survive module unload, and a rebind must reuse
them instead of failing.

[1/2] makes the registered properties self-contained in the never-freed
bridge allocation. One correction to my original report: the property
name strings I pointed at (prop_names) were never a problem - struct
ipu_property_names holds char arrays, so those are already copied. The
real module-image references were the "link-frequencies" property
values (pointing into the ipu_supported_sensors[] rodata) and the
"lens-focus" property name string literal. The link-frequencies one is
directly observable on hardware: with the creator module unloaded, a
re-probing sensor reads poisoned frequencies ("supported link freq
419200000ll not found"); reloading the module - which puts identical
rodata back at the same address - makes the same probe succeed again.

[2/2] adds the reuse path to ipu_bridge_init(): if the IPU HID node is
already registered, point the IPU's secondary fwnode at it and return.
The sensors' ACPI fwnodes keep their secondary pointers from the first
bind (nothing clears them), and with [1/2] the nodes they point at are
still valid.

Tested on a Surface Pro 7+ (IPU6 Tiger Lake, OV5693 + OV8865 + OV7251):
the PCI remove -> module unload -> rescan -> modprobe sequence from the
report, which today is fatal until reboot (-EEXIST), completes cleanly
with this series - "Reusing the previously registered software nodes" -
twice in a row, with all three cameras streaming after each rebind. Also
re-verified per Sakari's question that the failure is identical when all
sensor sub-device drivers are unbound before the PCI remove (answered
with the data in [1]).

The series was developed with the assistance of an AI tool (Claude) and
verified on the hardware described above.

Thanks,
D. Manresa

D. Manresa (2):
  media: ipu-bridge: don't reference the module image from the software
    nodes
  media: ipu-bridge: reuse the software nodes on rebind

 drivers/media/pci/intel/ipu-bridge.c | 38 ++++++++++++++++++++++++++---
 include/media/ipu-bridge.h           |  9 +++++++++
 2 files changed, 44 insertions(+), 3 deletions(-)

--
2.43.0
