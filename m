Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7AA424D65
	for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 21:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790287150; cv=none; b=Y3SXB/w8su0qQIZGZbtrOf+S5vPv2x8PSF9aprDacnRRJ9YGdaiYjzpRemMhzTIlGNw0ts3kaqpeQp3lvircu+bKGie7Ef1hjVjr7g/MoFec/JFVJORbq2W+PZ9en3BxnL0IiAEgFMySzzplHvh8ouTXLQganqvxbtzPqBtWBhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790287150; c=relaxed/simple;
	bh=rzRCEZsMmCVlK/LMyzVxVRKyYG2em2Z1VWAEwHTALnY=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=F64DwV1/XL5nv96nQuKnQnsaGIHXDhSna9yiO+9tIlcHn6054GoE8zv/Q+HQhTFD6qe95ZDTGqmlUKL8NpcrjIRvpL4Cz//11Nqe55A2PEyJo8HpvGKTmOoTaieZS5edvoq4Dww5rQD2RGgfN7K35r87veP54P31WsfNZh5Uq8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=fHVj+sYX; arc=none smtp.client-ip=185.70.43.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="fHVj+sYX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1790287145; x=1790546345;
	bh=+b066clVZKYPoHgBigF10Ti/RDxGiDr6ng9vRHCN0GM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=fHVj+sYXY7yq8YEpNthJ2rt7vZwUZI3JDjUpL7MWHGJy0rWR3qe1/+V9If4xcS9ws
	 mrALQ7wuPgwItsjv3A8hioYZAERVlwlf369M2y7h84X8x8bpY62zNPjZ0MPKJtwncT
	 vfdBo8fhOGSmyKsaADE49cKIrR94mYLdGJuT7a5ODO14vvR7oocx499VWew8rM6AM+
	 +I3+79ToDE/p+BlAtgcMf8aatKTKf/nQJK3LBm/p5ihgQ4H8WsWmpAHFhKaDy+Ru8F
	 w1IXj8sbcTiAu3QenVTQMoi/vbIW4mGnOecfFCpZ6S6vqessXZO/9UKPuW1HXEyu/8
	 zrRn2vZMgGi+w==
Date: Thu, 24 Sep 2026 21:59:02 +0000
To: Hans de Goede <hansg@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, linux-media@vger.kernel.org
Subject: [RFC] ipu-bridge: supplying a vendor-prefixed property
Message-ID: <20260924215857.48545-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 310ae9fab3f9e6dfc188073491d6c7f754f0c9ca
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Hans, Sakari,

One design question before I post a sensor driver, because the answer
decides what the driver looks for.

I am porting ST's VD55G0 to x86/ACPI - the IR camera in a Surface Pro 11.
The sensor has four GPIOs; on this board one of them drives the IR
illuminator. ST's driver learns which one from a device property,
"st,leds", read as a u32 array. On device tree that prefix is not
optional: a custom property has to carry a vendor one.

Under ACPI nothing supplies it, and ipu-bridge is where the rest of this
board's facts already come from - it builds bus-type, data-lanes,
link-frequencies, clock-frequency, orientation and rotation, and where
the SSDB is wrong it takes rotation from a DMI table instead
(upside_down_sensor_dmi_ids). Adding the LED index the same way looks
like the shape that already exists.

The one thing that stops me: every property ipu-bridge supplies today is
a generic name, and "st,leds" is not. The two ways I can see are

  - a vendor-prefixed property is fine in a software node ipu-bridge
    builds, and I add it beside rotation; or
  - it is not, and the driver learns a second, generic name that only
    ACPI uses, which means two names for one fact.

but I would rather have your answer than my shortlist - if the property
belongs somewhere else entirely, that is the useful reply.

That GPIO 1 is the illuminator here is measured, not inferred: mean pixel
value 117.95, 115.60, 117.71 with it driven against 21.51, 22.06, 24.43
without, on the sensor's own frames.

The series itself is in pre-review with Benjamin Mugnier, who maintains
ST's sensor drivers and suggested I put this to you; it is not on the
list yet, and this is the only part of it the subsystem has to arbitrate.

Sergey

