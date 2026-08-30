Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD983B5301
	for <linux-media@vger.kernel.org>; Sun, 30 Aug 2026 17:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788112615; cv=none; b=DRojnnRfWGsyBRKeyFa+WudlhttDDBlGsNcUhReuRXcS319pYYpLQnUI5lBiKqFZeHtywAUj5g3Mu/19m4iqhIkuF46bkMJQufPo0wwBjtcP9ZlKKZ5uFKVg02yHLkldYepK/HCIATn6ereJ9MGkm8cbv8UoUV1uD8UDHTXiEUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788112615; c=relaxed/simple;
	bh=z34r7sJUFPZ3LAvp1cjGAPishfKTCSs7GxbU9JfSONA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iou0FNlGqRZN9lks9hVoRsv07I2uTbMLxTXnIr92LeWkMtsA6K9w/BpXFmxXvP8+VLSCv4K8VUkJy0CaylOFLYWPWAFhBmMJ0Q1oC7Skt29nRNJQ07qnOZo9BQ6wGN8GSOG1r7rCD5H/NOh0hhCP/ry/w9puI4egYU9CbL645Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=themurphys.eu; spf=pass smtp.mailfrom=themurphys.eu; dkim=pass (2048-bit key) header.d=themurphys.eu header.i=christian@themurphys.eu header.b=miEKt+oa; arc=none smtp.client-ip=212.227.17.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=themurphys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=themurphys.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=themurphys.eu header.i=christian@themurphys.eu header.b="miEKt+oa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themurphys.eu;
	s=s1-ionos; t=1788112606; x=1788717406; i=christian@themurphys.eu;
	bh=z34r7sJUFPZ3LAvp1cjGAPishfKTCSs7GxbU9JfSONA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=miEKt+oaPJZUlCgmMy9ZvjyinOpj4exzyyLVI0yqmnSsRjXvlGoQU5gKsC1pN7PB
	 4sa0+0lTEcPII2ME31L8k4114++omB+4KSnRaaudSU1MXKJSqR9Qsq/lVaqNYBD/Q
	 PSry83A1vdGsSvUvXu9wJn3/BpE04PjCnjKPYI9WkqaFvc+4xT8FugX4LtF+49EBa
	 6B8aizDeERCDBxnnVDYv8paABeic+TzAsgn6fTRr9cZxII/ZxKfarhsNBhLchDK4N
	 CTfJYZqqZ2XefYo/w9hkagglQeKGBOFHEnfHFH4bVFtqccqgU4rkrDMXvgkrD5evC
	 kqJDDOYnjTLm1Y+7zg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue109
 [213.165.67.119]) with ESMTPSA (Nemesis) id 1MbRXj-1wU8yV1B5l-00ZsMR; Sun, 30
 Aug 2026 19:56:46 +0200
From: Christian Murphy <christian@themurphys.eu>
To: hpa@redhat.com
Cc: sakari.ailus@linux.intel.com,
	jai.luthra@ideasonboard.com,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: imx471: Add line length PCK setting
Date: Sun, 30 Aug 2026 18:56:38 +0100
Message-ID: <20260830175638.18597-1-christian@themurphys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <amih1psHfejzUs55@kekkonen.localdomain>
References: <20260728042013.23707-1-hpa@redhat.com> <amih1psHfejzUs55@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:64xJ12YcZIXy7RYM3wIT+sMZbvKigtAJGNEYSxTrothij6OvYvB
 DefHBzlCNYryiiIwmFkTNRg5ZYCRKDRKftbTlQraXmzxIX3tiEiL5PnTY1GxAo0cqB4VIiE
 1i+WUNrf3sJq6bgWoMlh3guuupfh72ZMtSiFfIqv2BuNw0toQ6KO73upfRlLLXIuEO5gGQf
 LBHablfA5KscKr1BoqqzQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fuLaUfZfwKE=;LpqIuaI3vEc9WJcu2A44EKOMsU+
 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
 p1cpeTqBQ==

Hi all,

On Tue, Jul 28, 2026 at 12:34:30PM +0000, Sakari Ailus wrote:
> If changing the horizontal blanking does have that effect, we should
> probably think of using a fixed value for it. Then the question is
> what is that value and what does it depend on (likely PLL configuration
> and external clock frequency, possibly binning etc.).

The pixel rate and line length fix is on the list:
https://lore.kernel.org/linux-media/20260830173345.15886-1-christian@themurphys.eu/

LINE_LENGTH_PCK is never written and reads back 5120, so 2328 was never
the line length, and 5008 would raise the frame rate rather than lower
it. The pixel rate is 387.2 MHz from the VT PLL, confirmed by timing
frames at several written line lengths.

The horizontal lines turned out to be a missing cache sync in the IPU7
ISYS driver (fix under review:
https://lore.kernel.org/linux-media/20260824224139.21256-1-christian@themurphys.eu/),
so a lower frame rate should not be needed here.

Christian
