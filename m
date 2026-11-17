Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927887;
	b=eF8iiALH7u0ri5/I7Jq3p82f8FLncuffnr+ZZESggLg61aj+BKCYZkSdwFLIsARv4Q5T
	 qw43ov07O7KlbDs9y033hA/bIA1TuetKsGJvMXkOf791/oG3PUSWOzEvqaN6zJoxMOUQ8
	 gR3mymz3qELyWO27MB/JDwBvGFi9IzQ4LcBLv7N65zvis8WTCu7YtYxGs8vY4uwoQpnDY
	 Hfka3JW6LdAnZhEN79FOesuu5UgF6AXJp5N4vERIxQEK5Gx7Kuas6sXwDI9djaXQQiRTA
	 CBICIkSFXrO7gg+HDS1nu3l9KmxA0n7SYB14NewkFWQDt+fBJ6uFC1PIn3aD+R1R4Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927887;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Njy9lx6tfdSPz7CzJl/O89y78uCmp30NNlyubwfn0hw=;
	b=x5eRE97dgnouXhwEGuG67/6g/svzwRBxz36fYxe0HKIG531k1+4s4YvqXYBLRDIK9oVY
	 vdy6vwMVXR35G53iPWP8IBY+BNO7uPgN4+eNxelW9GWcZ90Y8D4Ppg4OOhTdLL3/jpXO+
	 2wUTnwyH/U8CcbdtV1Ji5h0JVughOOmCZ7uncNWkjG6ECHbwcEX2wZmDIt+9MLl6w++H/
	 nXLWEtqGt7Enz88xedWiGlDbj+E9SSyqc7VuHjxw8KDmtNQWQE7B683GS/BubFUEBKjF3
	 dBMj/rNqcvliRapbm2V9XAtzpx8656zMBblEjkDxHkk41ZKOYJu9Picx5l6klqUfv1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=jiecNpB4;
	arc=none smtp.remote-ip=185.70.43.16
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141AD606A335
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 15:04:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 141AD606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=jiecNpB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794927885; x=1795187085;
	bh=Njy9lx6tfdSPz7CzJl/O89y78uCmp30NNlyubwfn0hw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=jiecNpB4MUDRE58OkVROVbor/3ZOwHaABcVy4+iwEfbsc0/HoQ8tufMIE6gqE9hHo
	 rs0OGwIlCiIEXQiX2ZVCyWidUnEXB8IrWcEvJ8U0xRQQcU2BBWsMU/EDr/uAebUbVf
	 3RNr3PupjUOB8oGARRwivlL7zeN3xjwLLiClnQjXAo88uerx8/yClmSh2ba+fuPZqW
	 lDslOnvtJQMUeUKz+kBwsy7UACCpVRX+IiADpqPW5u2XS23hs1QATIRMcedpgf3vKj
	 DA3vCGkeetShCwswYIef1LYHmWeoqyHFd09hFO2p6ZsxAVtXBifQABQdAOuT4KOLs2
	 7I4ccP45T8IOg==
Date: Tue, 17 Nov 2026 15:04:27 +0000
To: Antti Laakso <antti.laakso@linux.intel.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, Sarang Sapre <sarang.sapre@intel.com>, Divyamani Tripathi <divyamani.tripathi@intel.com>, Manik Bajpai <manik.bajpai@intel.com>
Subject: Re: [PATCH v2] media: ipu6: Enable snooping on ipu7 isys buffers
Message-ID: <20261117150421.33528-1-lsa.uz@pm.me>
In-Reply-To: <20261117084041.88457-1-antti.laakso@linux.intel.com>
References: <20261117084041.88457-1-antti.laakso@linux.intel.com>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 0e49a81abf54a00ce5bfbfb5dfe99aa1eaff2658
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Antti,

The code is the same as v1, which I tested on a Surface Pro 11:
https://lore.kernel.org/linux-media/20261117064321.98174-1-lsa.uz@pm.me/

Tested-by: Sergey Lebedev <lsa.uz@pm.me> # Surface Pro 11, IPU7

Sergey

