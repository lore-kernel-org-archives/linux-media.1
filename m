Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08322331207;
	Tue, 11 Aug 2026 20:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786481205; cv=none; b=n7xVG12N42/mbTfNstyGUF17mG7eFEmW/hVNn/ZrjNMW7jo6J/aKNZzL02kzY3+ZT77Dim6rVTWRY+italkP4OXGmnOLH/5hnkf1x94jNIxS+jTA2nmZZ3sgyMvSOCuVGNtxtXIhmDk2T9SOlK7G5w+udtHgdZzgG4fhFa9iFUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786481205; c=relaxed/simple;
	bh=wbinzThRuKGaPuoIICJWP7a4prk1iD0qlCWj3EkW57c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UmbuNeJLkExhm+hRTM/gZsPXUADeQZjApTyet5lgJOWOZ/txb9HqM4lgYr13LCgP25MIqSTduVbiL5hpjDLFmzVmy2NHMYp5NTURdiJeGnAOtZb/Q+2ZQtv1wuAZBrFJsApmyRwBjDSWxKCCwvvUq33b8OY/hLIxXJVRtPEe+l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kaitmazov.com; spf=pass smtp.mailfrom=kaitmazov.com; dkim=pass (2048-bit key) header.d=kaitmazov.com header.i=@kaitmazov.com header.b=ocDTzXXR; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kaitmazov.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaitmazov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kaitmazov.com header.i=@kaitmazov.com header.b="ocDTzXXR"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaitmazov.com;
	s=key1; t=1786481201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aDkKTQC9f3yIQxSXJJME0YlSAV3GHeMNq+8Rxpkv2uI=;
	b=ocDTzXXR35vVYPzxxe2NKc05DDr2b8qcuv/y0NUNpJ/yRVuUKEq+hC9zkiWVN05NiSDpbX
	EtmJWzX5fOuS3HE71ohRXS1wiurVZDyY6DH1G59X/V3dp4xC/IslwzyI0V5MZpy8Ned8lt
	FEffpXNM5dTZEvYjqa1EPTfS/INGUx1U1xawYx+xwOtmCYcsot9azy/Xf9zzausjd6eUrt
	Q3Iu6dW2KVCzljyEO4rMciL7TNz6qojaO6RG2Fw/cBLMFveWKGDZBaNPOB//adUkkVsNgW
	rAmZmUNxhEs+gODrjVxhZ9uz9TBHBJbAJQiB0P7oSSfNkwFV7yFfTabyTfdvQg==
From: Taimuraz Kaitmazov <taimuraz@kaitmazov.com>
To: mamin506@gmail.com,
	lizhi.hou@amd.com,
	ogabbay@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	Taimuraz Kaitmazov <taimuraz@kaitmazov.com>
Subject: [PATCH 0/3] accel/amdxdna: honour the SYNC_BO range
Date: Tue, 11 Aug 2026 23:45:53 +0300
Message-ID: <20260811204556.875037-1-taimuraz@kaitmazov.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

SYNC_BO carries an offset and a size, but amdxdna_flush_bo() honours them
only on the vmap path. An imported BO is tested for first and flushes its
whole scatterlist, so a sync costs what the BO is worth rather than what
the caller asked to maintain: on npu4 an imported 64 MiB BO cost 1056 us
to sync at every size from 4 KiB up. Patch 3 reorders the arms so the
vmap path is tried first, and indexes the page-array fallback from the
requested offset.

Reaching an imported BO through vmap needs two things in front of it.
Patch 1 refuses an I/O memory mapping, which the driver currently stores
as if it were an ordinary kernel address; that one stands on its own and
does not depend on the rest of the series, so it can be taken separately
or first. Patch 2 adds a probe that does not log, so that patch 3 does
not make an exporter without a vmap op print on every ioctl; it is a
refactor and does not depend on patch 1 either. Only patch 3 depends on
both: on patch 2 for the probe, and on patch 1 to keep an I/O mapping
out of the flush it adds.

The measurements in patch 3 were taken with the equivalent change in
AMD's out-of-tree xdna-driver, where this merged as #1541. That version
and this one differ in two places, neither of them on the path the
measurement exercises: it carries a second page-array fallback that
mainline has no field for, reached only when the mapping fails and the BO
is neither imported nor shmem backed, and the mapping helper has a
different name. The flush and the helper are otherwise identical. This
version is compile-tested; it has not been booted.

Patch 1 is from inspection rather than a reproducer. The exporter I can
test against is amdgpu, and amdgpu is the case that cannot reach it: it
implements .pin, so a non peer to peer attachment like this driver's
forces the buffer to GTT before anything maps it. Reproducing it needs a
GPU whose exporter has no .pin, which I do not have paired with an NPU
here.

Taimuraz Kaitmazov (3):
  accel/amdxdna: refuse an I/O memory mapping of an imported BO
  accel/amdxdna: add a quiet variant of amdxdna_gem_vmap()
  accel/amdxdna: flush only the requested range in amdxdna_flush_bo

 drivers/accel/amdxdna/amdxdna_gem.c | 53 +++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 15 deletions(-)

-- 
2.55.0

