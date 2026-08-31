Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAA53DA7F6
	for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 10:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788171814; cv=none; b=OBYMfs3Kgru9L1wlAY7YQa1cxVCgrrlrCt5Vrm2qbA11qTBXrnxGrj3lxGdGMC/r92chirKr5f/fahYVuc8CWQMEP+D0WjxJ5nHvoX3SErn16BwYGs3GHYVz0N+RpUMgxwj6Ro8BfEYZSOjN2lqYjsSIaATAuqzmk8UcnqMW460=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788171814; c=relaxed/simple;
	bh=wt/NCQ9rrEf14zO3GiGdIb4HU9ju8kjrl2E7dzq1UbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jkr70r8Rk41zAlcPhv2BeOD379yhxHW0kvadJjjPZEz2Tz1U0EaHqrqIDBAve/t7X+YTL/UAjD8pbdAcVV6d8EdSbjv+NHQm2ZMZq7tg/qXeG3VkMb9HXasQycD9pVVIs+HyzliN8K9CIuaRJaMfuX7frMTRewEcT+clcX4Axcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sUvhfHvv; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sUvhfHvv"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso22095485e9.1
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 03:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788171810; x=1788776610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2TZ6Fgc9jUQiAVNyqldWXM4Av0maVcK8yGE9huIbARo=;
        b=sUvhfHvv+Jg8bK8gqo7rXbturp4ezyGEe/HnSdj88VfdTWOkKK2FxI3WZuf/BvfxWF
         MNunFFLo1A8FGXtlehIMJz4h1r4bbFofqbSmzcwzddBo3onvpt9PQOf78CAARI9jERUe
         fQYESPq23hS75sFc6vujix4CQvfEhDmtRmlArX7sxY59du3YHRHTiiqo8Q4jqRJTt7lq
         7rPb3Q+Romo/4l/ggRJz1MDGimAA4hJhclGdMP8luv6jsGwj1b8UOauoJDk/eSI8nk3M
         mSgJZz1cRj8EulycpOAW9/bRhDNZD3DHpPv22VlGn6w2Wzuk8x2Mbb7L+WhCRdJ6Cz/n
         J+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788171810; x=1788776610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2TZ6Fgc9jUQiAVNyqldWXM4Av0maVcK8yGE9huIbARo=;
        b=jk6OoEwnyZImY2zkUHgw6XQNbbzAOIQPCmz2Dp+UXzp9Ax3d0nfsRUO65ItnQuL/ax
         IttD4nnPObLT0UuFid6pGxwoUovIznLThl4kT+IMhs3tMDCdFAyvUgPtVEDQgli3Qva+
         aJLrv6u6nqCTl0NoupwBci+byrwv7dHwMO/qpLpwjtSUM+p4AL91zV9oK0V8S7TbBcHe
         VbKF31xGk1xtPralNqbONZK4qFUwczpVco16PEJeK7QZKozMUV+hnjI9kh+5TnQSlPRp
         3F2O5hANVHsyYb2imVjSy1VzvCZ3ddiecGEWQaFmfPi6KAY3RYUwXNFA6ZID5i2bKBWP
         adaQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro+/h8BOU/9mOEFZA8UKXlu1/yl1O62xvZzTMBKYqnsl5Zh1+x8YkcM6+kp3plVsMEtZk23eZIqEuYy1Q==@vger.kernel.org
X-Gm-Message-State: AFuF++kj2enTpXl16JPWHWa81xhRNY0g4RTVHgBmZ1aT9mE6hhZJr/YI
	IgWLnoHI7L4vmJk923LnikFBMEIdExV1kOExQ2V0Ipllc8PXGXvhBvE=
X-Gm-Gg: AR+sD12PQ1ePDA21EMQdbtJXoFJDo2yGQ9k9cvOPY/r+r4prvzB0SwqGiix2NK3yuii
	2HgkqzIJ+lN2e71e21H14MJsZWK+igGm3upNEo5dHh3+lxmq9GIPaNmUtTOEkoTxa0mmD9sNeyY
	QLs28Gk/Lu9zgG0pdOfcIPkcapum8xZkpiicaZzM5GhZ34IhhzGHz+lySczXQyhbs5fMS2YiTkQ
	J06JJuwQmOFQVbdl2j/2wkiWp5pIr9PYzodSFa0jCYXXL8xZDXCFohgCe9zc7ZWXIK9IvtyglFO
	w+r6NGELkTjBCVAP0MIdhJkBOxa9oc+EpVx0Jpb0sk65Y9q2gs8x2jXTEho6FPMzMRRAtkkzgcb
	QuGZDIDfzrZUvre6UinYE6CEvIm8HcuitVQL06IlLgGCzwDOPqE8v/WJlE8pxYGQlxtDz5R5owk
	lgfxYYLvSRjzWDssoO6CuK0Yx+aivTn7O5SBVBUjmD2HPoT5vaavtMbIYZoCBVjlaobLh5ulzzt
	CJyCcSk3aga02k0angURmVpJxKHrTSv45tHH260/Kwo
X-Received: by 2002:a05:600c:528b:b0:49c:d818:8771 with SMTP id 5b1f17b1804b1-49cd81887f8mr65055955e9.7.1788171810244;
        Mon, 31 Aug 2026 03:23:30 -0700 (PDT)
Received: from surface.. (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm336393985e9.4.2026.08.31.03.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 03:23:29 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"D . Manresa" <dmanresa@gmail.com>
Subject: Re: ipu-bridge: software nodes are never unregistered; PCI remove/rescan of IPU6 fails with -EEXIST and leaves dangling properties
Date: Mon, 31 Aug 2026 12:23:28 +0200
Message-ID: <20260831102328.36764-1-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <apU1JxHwqGsQOIlQ@kekkonen.localdomain>
References: <20260827232636.93145-1-dmanresa@gmail.com> <apU1JxHwqGsQOIlQ@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[Resending with the lists on Cc - the first copy of this reply went out
to the people only, due to the same mail tooling error on my side that
Hans just caught on the int3472 patch. Fixed now; apologies for the
duplicate, Sakari and Hans.]

On Sun, 31 Aug 2026, Sakari Ailus wrote:
> I recall unbinding the ipu6 driver successfully in the past. Do you ensure
> above all sub-device drivers have been unbound first? I guess the V4L2
> framework nor the ipu6 driver necessarily ensure that right now.

Measured it, since the machine reproduces this in a minute: unbinding all
three sensor sub-device drivers first (ov5693, ov8865, ov7251 - each
confirmed unbound via sysfs; the VCM client had no driver bound) and then
running the same PCI remove -> module unload -> rescan -> modprobe sequence
fails identically, byte for byte:

  sysfs: cannot create duplicate filename '/kernel/software_nodes/INT343E'
   software_node_register+0xd2/0x120
   ipu_bridge_init+0x192/0xeb0 [ipu_bridge]
   ipu6_pci_probe+0x417/0xbe0 [intel_ipu6]
  kobject: kobject_add_internal failed for INT343E with -EEXIST, ...
  intel-ipu6 0000:00:05.0: error -EEXIST: IPU6 bridge init failed

Which makes sense: unbinding the sensors neither unregisters the bridge's
software nodes nor clears their ACPI fwnode->secondary pointers, and the
-EEXIST happens at the IPU HID node registration, before any per-sensor code
runs. A plain module unload/reload without the PCI remove does work, as you
say - the device keeps its secondary fwnode, so the graph is still wired -
but any path that goes through device_del() (which clears the secondary via
set_primary_fwnode(dev, NULL)) ends at the -EEXIST.

While re-testing this I also got a clean confirmation of the dangling
link-frequencies: with the creator module unloaded, rebinding ov5693 against
the surviving nodes fails with "supported link freq 419200000ll not found"
(-22), and the same rebind succeeds the moment the module is loaded again -
identical rodata back at the same address under the stale pointer.

Hans: thanks for the quick ack on the split. Series sent as

  [PATCH 0/2] media: ipu-bridge: survive module unload and reuse the
  software nodes on rebind

threaded to this report - with one correction to my point 2a folded into the
commit message of 1/2: the property *name* strings in prop_names were never a
problem (char arrays, already copied); the real module-image references were
the link-frequencies values and the "lens-focus" property name literal.

D. Manresa <dmanresa@gmail.com>
