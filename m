Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FC2429CDA;
	Fri, 17 Jul 2026 15:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784302168; cv=none; b=jwUMou9ZQSD98YEugLB16y3GoWhvcxcdQhujmGL/1fKHY1QUgXH6Us9NnwietDiIHxVal1DVfiEMpa78UPUCOMGOOC7uINPmANE0bdFs+h3zujG3yy2JmTV5Wjkkybs+EenbSHy8+q7W098DfI8sBBD9j5Njt3qx+EmP9sbqo40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784302168; c=relaxed/simple;
	bh=iTcn68zjNtWpuvUjVltPKPZ1D1yPX6EtcDbq4umcyg4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=igc1jDh3hv7baTCcMos51m0VX3iT6uO/1nMrspe2xZ47FG9jheVPr4oppFraz3LQ+XS3D7xCzHHwwLpVur/ofxgA09fwtbjtyFAxDCeawK+nq5pu0Gs0hRvtJzfzRLzXAmsk7I4VIq7M8WLYZVFL2f8vaAOsBiwem9b039etSCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=i7bGZ++H; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="i7bGZ++H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784302165;
	bh=iTcn68zjNtWpuvUjVltPKPZ1D1yPX6EtcDbq4umcyg4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=i7bGZ++HIOq+Rs7hQUb0OCVP+4/2P7b9r4vGY9ujCcXK0cfLLf7MfK664oL8442BX
	 bdrAkLqyeZhzAkt4+h3BE+udp+w8WR90gARzcPTkkFUsvWVx382Sncuf9Au+tNqm6t
	 +JKHk/N2AmqeK7uuOf07gPYBXBEcQ/+VcntrQLFMGawNWe635PJDIPTNGcNK03IdkD
	 78DA5vEBHPdU9j8gPYdsoTnmBokJjamZ9OFGKJEFTOZyhtqm0gAPWdHXgzhe+bCX3C
	 IxVNGQRSekGSNQEyb2jxW8HDQ4GuY1heWxqx5uy2tpX9EEr1QzHXRp5rlKxL5Rt1zh
	 NUyeU0BHrbi1Q==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AE4B717E0D7E;
	Fri, 17 Jul 2026 17:29:23 +0200 (CEST)
Message-ID: <6c3081fed130534ac0d5cf83c7658bb13e0bfc7b.camel@collabora.com>
Subject: Re: [PATCH v3] media: rkvdec: fix clk reference leak on unbind
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Francesco Saverio Pavone <pavone.lawyer@gmail.com>, jonas@kwiboo.se, 
	detlev.casanova@collabora.com, hverkuil@kernel.org, mchehab@kernel.org
Cc: ezequiel@vanguardiasur.com.ar, heiko@sntech.de,
 linux-media@vger.kernel.org, 	linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, 	linux-kernel@vger.kernel.org
Date: Fri, 17 Jul 2026 11:29:22 -0400
In-Reply-To: <20260717150440.77079-1-pavone.lawyer@gmail.com>
References: <20260518145414.64514-1-pavone.lawyer@gmail.com>
	 <20260717150440.77079-1-pavone.lawyer@gmail.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-4A3S8TQKw0LbkarlVsuL"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-4A3S8TQKw0LbkarlVsuL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Francesco,


This was sent as a reply to v2, best practice is that new version should be=
 its
own thread. This convention is best for patchwork tracking and other tools.

cheers,
Nicolas

Le vendredi 17 juillet 2026 =C3=A0 17:04 +0200, Francesco Saverio Pavone a =
=C3=A9crit=C2=A0:
> From: Jonas Karlman <jonas@kwiboo.se>
>=20
> remove() calls pm_runtime_disable() before
> pm_runtime_dont_use_autosuspend(), so the second call can never suspend
> the device: it reaches rpm_idle(), which returns -EACCES once PM runtime
> is disabled. The probe error path has had the two the other way round
> since the driver was merged.
>=20
> This shows up when the device is unbound while the 100ms autosuspend
> window is still open, which is what an rmmod right after a decode does.
> device_release_driver() calls pm_runtime_put_sync() before .remove(),
> and rpm_idle() adds RPM_AUTO on its own, so that put only arms the
> autosuspend timer. pm_runtime_disable() then cancels the timer, and
> pm_runtime_reinit() relabels the device suspended without calling the
> driver back. The clk_bulk reference taken by rkvdec_runtime_resume() is
> never dropped, and a later probe does not reclaim it, so every such
> unbind leaks one enable count.
>=20
> Drop autosuspend first, so the callback still runs and releases the
> clocks.
>=20
> The PM calls also have to move ahead of rkvdec_v4l2_cleanup() rather
> than just swap with each other. rkvdec_runtime_suspend() looks its state
> up with dev_get_drvdata(), and v4l2_device_unregister() clears it:
> struct rkvdec_dev has v4l2_device as its first member, so
> &rkvdec->v4l2_dev and rkvdec are the same address and the check in
> v4l2_device_disconnect() matches. That is harmless today because
> pm_runtime_disable() suppresses the callback, but once the callback can
> run, a suspend after the V4L2 teardown dereferences NULL. Swapping only
> the two PM calls oopses on every unbind.
>=20
> Fixes: cd33c830448b ("media: rkvdec: Add the rkvdec driver")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> [fsp: wrote the commit message; the diff is unchanged]
> Tested-by: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
> ---
> Changes in v3:
> =C2=A0- Rewrote the commit message, and dropped the VP9 claim from v1 and=
 v2.
> =C2=A0=C2=A0 Those said this fixed a VP9 inter-prediction bug on RK3588, =
green chroma
> =C2=A0=C2=A0 from the second ALTREF frame onward. The bug is real, but th=
is is not
> =C2=A0=C2=A0 what fixes it, and I should have established that before sen=
ding v1.
>=20
> =C2=A0=C2=A0 What happened: I took this patch out of chewitt's tree along=
 with two
> =C2=A0=C2=A0 others and tested the three as a batch. The green is fixed b=
y "media:
> =C2=A0=C2=A0 rkvdec: implement reset controls" from Alex Bee, which adds =
the
> =C2=A0=C2=A0 reset_control handling that recovers the VDPU381 after a tra=
nsient error
> =C2=A0=C2=A0 (COLMV_REF_ERR_STA and friends) instead of leaving it dirty =
for the next
> =C2=A0=C2=A0 inter frame. Randy Li's PMU idle export goes with it. This p=
atch was the
> =C2=A0=C2=A0 third one in that batch and got the credit.
>=20
> =C2=A0=C2=A0 Retested this week on the same Rock 5B+ with an unpatched dr=
iver: a VP9
> =C2=A0=C2=A0 Profile 0 1080p clip with alt-ref frames decodes byte-identi=
cal to the
> =C2=A0=C2=A0 libvpx reference, across five rmmod/insmod cycles and after =
an unbind
> =C2=A0=C2=A0 inside the autosuspend window. The green does not come back,=
 because the
> =C2=A0=C2=A0 reset_control work is in the tree I test on. Sorry for the r=
eview and the
> =C2=A0=C2=A0 testing you spent on that basis.
>=20
> =C2=A0- Worth flagging separately: mainline rkvdec has no reset_control s=
upport
> =C2=A0=C2=A0 at all, so the VDPU381 is never recovered after a transient =
error. That
> =C2=A0=C2=A0 is a real gap, it is just not this patch. I can write it up =
properly if
> =C2=A0=C2=A0 that is useful.
>=20
> =C2=A0- The diff is unchanged from v1 and v2. It is Jonas's 2020 commit v=
erbatim,
> =C2=A0=C2=A0 and his original one-line subject already described exactly =
what it does.
> =C2=A0=C2=A0 The wrong story was mine, not his.
>=20
> =C2=A0- The subject changed with the message: "media: rkvdec: fix PM runt=
ime
> =C2=A0=C2=A0 teardown ordering in remove" in v1 and v2, "media: rkvdec: f=
ix clk
> =C2=A0=C2=A0 reference leak on unbind" here, since that is what it actual=
ly fixes.
>=20
> =C2=A0- What is left is measured. With a dev_info() at the top of
> =C2=A0=C2=A0 rkvdec_runtime_suspend(), autosuspend_delay raised to 60s to=
 take the
> =C2=A0=C2=A0 timer out of the race, and unbind driven through sysfs:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unpatched: 0 suspend callbacks, aclk=
_rkvdec0 enable_count 1 -> 2
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 patched:=C2=A0=C2=A0 1 suspend callb=
ack,=C2=A0 enable_count 1 -> 1
> =C2=A0=C2=A0 The leak survives rmmod and accumulates one per unbind. With
> =C2=A0=C2=A0 autosuspend_delay=3D0 both orders suspend once, which is the=
 control: the
> =C2=A0=C2=A0 difference only exists inside the window.
>=20
> =C2=A0- Fixes: was wrong in v1 and v2. ff8c5622f9f7 has the two pm_runtim=
e calls
> =C2=A0=C2=A0 as context and only added iommu_domain_free(). cd33c830448b =
added remove()
> =C2=A0=C2=A0 with the reversed order, and the probe error path with the r=
ight one, so
> =C2=A0=C2=A0 the tag points there now.
>=20
> =C2=A0- Dropped Cc: stable. A clk reference leaked on unbind is not backp=
ort
> =C2=A0=C2=A0 material, and the tag was only there for the VP9 claim.
>=20
> =C2=A0- Dropped your Reviewed-by and Tested-by from v2: they were given f=
or a fix
> =C2=A0=C2=A0 to something else.
>=20
> =C2=A0- Not included, happy to send as follow-ups: clearing empty_domain =
after
> =C2=A0=C2=A0 iommu_domain_free(), and hoisting the unregisters to the top=
 of remove()
> =C2=A0=C2=A0 as you suggested on v2.
>=20
> Tested on a Radxa Rock 5B+ (RK3588) on a 7.1 tree where the six calls in
> rkvdec_v4l2_cleanup() are open-coded; the executed sequence is the one th=
is
> patch produces. VP9 decode stays byte-identical to libvpx, and five
> rmmod/insmod cycles leave dmesg clean.
>=20
> Link to v1:
> https://lore.kernel.org/all/20260518105413.42147-1-pavone.lawyer@gmail.co=
m/
> Link to v2:
> https://lore.kernel.org/all/20260518145414.64514-1-pavone.lawyer@gmail.co=
m/
> =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec.c | 5 +++--
> =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> index 1d1e9bfef8e9..0ec3fca9cccc 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -1869,12 +1869,13 @@ static void rkvdec_remove(struct platform_device
> *pdev)
> =C2=A0
> =C2=A0	cancel_delayed_work_sync(&rkvdec->watchdog_work);
> =C2=A0
> -	rkvdec_v4l2_cleanup(rkvdec);
> -	pm_runtime_disable(&pdev->dev);
> =C2=A0	pm_runtime_dont_use_autosuspend(&pdev->dev);
> =C2=A0
> =C2=A0	if (rkvdec->empty_domain)
> =C2=A0		iommu_domain_free(rkvdec->empty_domain);
> +
> +	pm_runtime_disable(&pdev->dev);
> +	rkvdec_v4l2_cleanup(rkvdec);
> =C2=A0}
> =C2=A0
> =C2=A0#ifdef CONFIG_PM

--=-4A3S8TQKw0LbkarlVsuL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalpKUgAKCRDZQZRRKWBy
9LVmAPwMv14zaHFi949qsM/I622p/lShXu6bK/Y2Jtuyp6tUgQD9HpiozNEK6eiz
QWlJkJR7ZdBh1nrOUCeKvZ7oVIvUDQU=
=C564
-----END PGP SIGNATURE-----

--=-4A3S8TQKw0LbkarlVsuL--
