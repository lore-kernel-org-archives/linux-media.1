Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C02481241
	for <linux-media@vger.kernel.org>; Sat, 12 Sep 2026 18:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789239527; cv=none; b=L2eec7iGiYvU3H3JOZmPq6M4u2pMUTEkdzxNiVyH6sPs1GLKbfMyC8LX1CQXem1WvHuJ/loGNWEZU0A1taWjLA386hLKYpkf/a6EllbsoPgNUp9b8WN9jcVoXopDGKlcdNeaxgeES7V5u7Damd+50KfB711I9VdLHbY4Oqer6Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789239527; c=relaxed/simple;
	bh=6ifQp3FXtWEHTpxNoKH0/DPWuc9MrmA9IwGNt3nWKXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YAKjP7dbpY/TDohG610fWZRJCs94SXDUrEyvjVxvFlVWgTIPSRyhgf26Og8ezdeMrjVOZn4YLOsDp2K0hUBALJFO3h2Jhf4quhixnsiJd8VEJnUWMNaBzke4qRswjVhOmrlDD5IfGxhKEcpwy8+Oc9ukqP3zcg3XkGN2Iet2OLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=k0eUHdPZ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="k0eUHdPZ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso8109405e9.3
        for <linux-media@vger.kernel.org>; Sat, 12 Sep 2026 11:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1789239523; x=1789844323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=geHc6ZRgXBs4LGneGsLJwFq8joGwyFOhKqqUN3QWAxk=;
        b=k0eUHdPZVT//sNzWgwF2PQJiMmCrYldnQCGSF+uf0u4IXssZbVpPXixdcIVw+3hGKT
         jJvSVGo1DA9vpF1OUjypWIcD18EEbAhrVFCuN/bRCgER73Adt6+sTRwICaw9JMv7p9Od
         Mt9+22oO6hNJLYAMxQ95uZP9CC2XT51CBjkGu2+7yAQMXq2to8k46rhjqhRLiaP9xKgR
         TbVkesOIelN1TPrk6l3x7oit0nX7XM2gw1qC2ZfezMU6IqVbxF+vtRphQnbe75vYNLqX
         6Lnu/u+kPnEc/GCLdvNFUwjBIJPK21H2rRL4ajr8ty2IAArNnd70ugwMnX/u768c4HSg
         64aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789239523; x=1789844323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=geHc6ZRgXBs4LGneGsLJwFq8joGwyFOhKqqUN3QWAxk=;
        b=IdtZzUnpfCdf6mQWyU7C43M66vlQ5aQaHx0+KTmad2X8bsYTYCM9id7qRuE88tUVJb
         rGuqESF5pgBMqw5E8/pp8tlMUsIJ7mIMxdHJtEnpKyx42j7KdGEvwAYDy3ptX4geBluf
         FUGRZPcKyIlJflnwvl+D8cRjBQfens4JVpA9XP/mfyoA44CY4i8jfrs2KqFM+sAb7KP3
         WyHkI3+7iEYci8hALfn7JEttVTNXMKAea4s6tQSzXAb/pXhHzhKw4oJo5cKNrGOPRzCF
         zSzYtDXafQou4/jw/4jMbII61Sdz2UcBuzXaGAUhVf7YYVICekXhu/CC6Yzar7gfdplY
         BblA==
X-Forwarded-Encrypted: i=1; AKwUvBx3FfRgP43hZdSafIutN3vYRRC8pvHu2l1fHpTlEwFfdsIwLDH3hQarbIKp82DObRJ4L7Ng6PW23pbCeA==@vger.kernel.org
X-Gm-Message-State: AFuF++nXPUNzhOf7cwrd/yWPL1YXwH+Uk1dJqxZQ2HtHon6G0Q21ccxd
	hHh5d1LLa5++xPfpfZ1fi2izaf3iDcqvCsgR5tPNUE9qBIKt4opxifKahJRArnCF
X-Gm-Gg: AYBFou2CP1LaEe7ZjNBPmC9uLCXVJsFpw7pilEnKub2boef1iRqBm3qPggJpOOMnqTW
	2J0/x6cBWouth78QGBxxY/85fCG1hZ0JVYqtPNqHdflA/HG0WVwBKsQDqy0YVmkt4Y/bkgxfnqU
	//IOznSzsVNEnkPtRbCatM/ZxZr2/GEjSgjLp5IZqFiB/L+b7DhV6cvkJTPrCz+WNQb3+9EZk6N
	VoI4xOHvMbif4+k8A+U/Ck/Yd4Js4HJ0zOyRn7xZdLBXH4lceDeOS0B867drmwdlap867c4qHfs
	44Rth9O3JIIHEqcw3UL0IVzKjqHLzOCxbOC/QMFtVNE+XvuyfDsHBULsKYT3Uo6qYIXoCV5Mk8w
	honYxrr0iCtOSAY93UXsylrxOyHxOFTQ9QTgeULJECicAluAhmcoHZRscUn67j+3zuwroqmDYH3
	CfarcdOmKbLYCrv2J20skTmLFlPCLT6aSXEJLH4L2QK/bD2t48KutweQG5eHG9fSLyM2WzJ3lD+
	w6XGwcO97mo0J+rEDJE/kp01nId88VX0Mbr0nUpm97nzsCMmHogH7COKBfrjU+W1Wwv
X-Received: by 2002:a05:600c:8a16:10b0:49c:c0d4:53d9 with SMTP id 5b1f17b1804b1-49e61999d61mr77657575e9.14.1789239523304;
        Sat, 12 Sep 2026 11:58:43 -0700 (PDT)
Received: from omarchy (p200300dec74de0c8a140e932207b74a4.dip0.t-ipconnect.de. [2003:de:c74d:e0c8:a140:e932:207b:74a4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34f1f7sm14655184f8f.24.2026.09.12.11.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 11:58:41 -0700 (PDT)
From: Manuel Knitza <manuel.knitza@googlemail.com>
To: gvozdoder@gmail.com
Cc: sakari.ailus@linux.intel.com,
	miguel.vadillo@intel.com,
	linux-media@vger.kernel.org,
	Manuel Knitza <manuel.knitza@googlemail.com>
Subject: Re: [PATCH v3] media: ipu-bridge: do not use the CVS device lookup for IVSC
Date: Sat, 12 Sep 2026 20:58:32 +0200
Message-ID: <20260912185836.309071-1-manuel.knitza@googlemail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902211524.5572-1-gvozdoder@gmail.com>
References: <20260902211524.5572-1-gvozdoder@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CVS side of the same commit breaks cameras too, in the mirror image of
what this patch fixes, and I think it is the "separate series" you mention.

Dell XPS 16 DA16260, Panther Lake, IPU7, ov08x40 behind a CVS device
(INTC10E1). 7.1.8 works, 7.2 does not:

    /sys/kernel/debug/devices_deferred:
    i2c-OVTI08F4:00  ov08x40: waiting for fwnode graph endpoint

No sensor entity in /dev/media0, no subdev, no camera in userspace.
Traced to the same commit you cite, c6b1b34b5090 - not by bisect, by
diffing ipu-bridge.c between v7.1.8 and v7.2.3: it adds
INTC10DE/INTC10E0/INTC10E1 to ivsc_acpi_ids[] and touches nothing else in
that file.

Your reasoning for keeping the fallbacks for CVS is

    CVS binds a driver to the ACPI device itself, so matching on the
    companion stays unambiguous there.

The match is indeed unambiguous. The problem is what is bound. On this
machine the driver on that i2c device is Intel's out-of-tree intel_cvs
(from intel/vision-drivers), and it provides only ownership arbitration and
firmware update - no CSI-2 subdevice. ipu_bridge_instantiate_ivsc()
attaches the software node to it and reports success, so the sensor's graph
terminates at a device that offers no endpoint, and the sensor waits
forever. There is no in-tree CVS driver to take that role.

So the lookup finds the right device and the wrong kind of device. Skipping
the three CVS IDs in ipu_bridge_get_ivsc_acpi_dev() restores the 7.1
behaviour with everything else unchanged:

    bind ov08x40 17-0036 nlanes is 2 port is 0
    All sensor registration completed.

Sensor and CSI-2 link back in the media graph, real frames, and it survives
s2idle suspend/resume. Tested on 7.2.3, stock and Panther-Lake kernels
alike; both carry identical ipu-bridge source.

That is only a workaround - it disables CVS support wholesale, which is not
what anyone wants. The shape of a real fix is presumably the separation you
already named: take the CVS path only when something is bound that actually
provides the CSI-2 subdevice, rather than on an ACPI ID match. Gating on a
bound driver would also cover the ACPI half of the same conversion,
c28527ce5d06, where a dependency on an unclaimed supplier blocks
enumeration outright - kernel bugzilla 221988.

I am happy to test patches; this machine reproduces both the failure and
the fix on demand, and I can build and boot either kernel quickly.

Reports with the details, if useful:
  https://bugzilla.kernel.org/show_bug.cgi?id=221988  (comments 9 and 10)
  https://github.com/intel/ipu7-drivers/issues/102
  https://github.com/omacom/omarchy/issues/10948

Assisted-by: Claude Code:claude-opus-5
