Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443153;
	b=hKX7UUTu+YjCjW7t/4zFGOpHLrAuL61JsQsSB2XbchZAPkXxXxKniFM7fMtP1nqFk7NX
	 A1FftBYqcEk26P9RDpDUhucfmhZh3+FCsih1NirTFJsDZhE9/9TJxJdtae9ZvM/ntRGrB
	 WVGF8/DDM5Yx/cFDv/0NzMj5f1QzeG9jJLJYeusrCGxqKBJ3B1NxTzPNUMRPb0nlfjvdp
	 fg8cQHx5wKGjOz1EGQbGf2sfYjdc8Xxdiv8CdVy3OhfX5A6BSbZTELAo8iTghuaXnm2Wu
	 8+zcA4gHvSnCaBdQxXqxySlXFIxQNFG2Pk+Ho2vJbwC9tR1a8HBWtbne36ou7+YttQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443153;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=GMI4Me2ARFv/4uojQIezkuj7KG00oQdLi8a3gMfNyYw=;
	b=O7Nwel4SvG9Q5BFop/VDQAmgZgBcOotaROFGNDclCJbYmrBFOeBbMKRiPE5adNIC2/9g
	 k88l4dGHz0QY1ersxgQ/MEcUVaS4qT4nkjsOR69cSkE7MPJDcPe8iiQCRtT7FwdfDGWU9
	 LuOc+dXjPfIrxWji5DjX5ulqrvL7/cIkvtvsRO0e4pMHClZTkFS48QqO3e0W3iw9WgWhG
	 lCT72z5Mnaj3UUih8DLQ7G9o7Sa/vTRcP2v4S5j5FvUnmHvNBgOPPZt6KKY4fJWMdEcKw
	 eC0hpY+to60RqBtGTcpW44HkJj4L3EJYV96T8zrjA6fQ36gn7blw9M5PzO8K0JkMIiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S6OZYZQI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70322606A32E
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 14:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S6OZYZQI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32F191F000CF;
	Mon, 23 Nov 2026 14:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795443152;
	bh=GMI4Me2ARFv/4uojQIezkuj7KG00oQdLi8a3gMfNyYw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=S6OZYZQINeSdk9a1HcPQTKfFzXeTSQQCP/XOCS7hYqZ7seehwGV9ulIonfWXVJ6Ed
	 rp+2dl0E9yz+Lr/+Ghz/+uKcjMJAPZqJoFWdN57u37aRfYMuLhMHikpgJUvyUa0doQ
	 4XM3oKjoAhEAkyhKQeaq1vLztctfMAfzteTrLkq7epqFrfAJiYZ9LU3b39sfrs1axH
	 PENtQzkCW4L5tfnU6hRrGfSuWzHaMvMHX5EiPqPjyx0FlNE6YQVoeOWXkj9scWJBbD
	 59E/9cuM6eY3gvf7wkn/9QqWHTXhcPdzFS5KQHn94UZrEoKO/SZaUZGGuZFkGxs9VA
	 wt9/pKQzLhT0w==
From: Maxime Ripard <mripard@kernel.org>
To: linux-media@vger.kernel.org,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	dri-devel@lists.freedesktop.org
Subject: Re: (subset) [PATCHv3 00/13] media/drm: cec: add HPD_PRESENT
Date: Mon, 23 Nov 2026 15:12:27 +0100
Message-ID: <179544314318.1189238.7248780865420148038.b4-ty@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1793863347.git.hverkuil+cisco@kernel.org>
References: <cover.1793863347.git.hverkuil+cisco@kernel.org>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 05 Nov 2026 08:22:14 +0100, Hans Verkuil wrote:
> Using the media CEC framework the application receives events when the
> Physical and/or Logical Addresses change. However, if the Physical Address
> changes to f.f.f.f (Invalid), it does not know whether that is because the
> HDMI link is disconnected, or because the EDID does not provide a valid
> Physical Address. That can happen because the display does not support CEC,
> as is the case for DisplayPort inputs or PC monitors.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next)

[01/13] gpu: drm: sti: call cec_notifier_phys_addr_invalidate if no HPD
        commit: 87eab2c253293b14d0b47ea9680654ba2592ca95
[02/13] gpu: drm: exynos: call cec_notifier_phys_addr_invalidate if no HPD
        commit: d35eaf955b325239ac67d51e910e149cf59243b8
[03/13] gpu: drm: omapdrm: call cec_s_phys_addr only if HPD is present
        commit: a4db1e6625e4bb77fb7e7d937d85edb9bd511c58

Thanks!
Maxime
