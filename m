Received: from mail-qt1-f201.google.com (mail-qt1-f201.google.com [209.85.160.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6341E3655E9
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 20:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782161056; cv=none; b=iTbnNN/kfud/kn+xkTQcmUdviscereK3dWycCIbp7uNDrfnoVUIubU24/pz59q22IMMmp9Vtg7ymaW2v+2/erLBw6+2AtdQWRh7/mQ8WYgf26qP/TgoIvZyyUnM6jzRE7Ui/OcBUbjY+lHSoeA600dvSZTlN1OyFXVSpYS6P1fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782161056; c=relaxed/simple;
	bh=wjti8bknEcTX8FcniewZeDWvKL403gQyFz+BxaWi4QE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tVvUx35pGRiw0xzH1Kipv5rTRsQc02f9DpcZjxkvqTJF+UcEoHMZR6Pt3cyfvbyutib2/jGpEjaPwHBM4+NIE9riufpDj59gEGWN3s4CqbnHae+BarAvwzUdyXn7jhFBPyKb6s7tYMR8PjJMEq3OBdqe4uAcwULwVeiD9c01lgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--briandaniels.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LoFqWw0Z; arc=none smtp.client-ip=209.85.160.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--briandaniels.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LoFqWw0Z"
Received: by mail-qt1-f201.google.com with SMTP id d75a77b69052e-519e4aaec80so68629771cf.0
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 13:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782161054; x=1782765854; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oeY7Afs0lbHnR0QncCnTUELZnAVrZhoU3GxTUGfziYk=;
        b=LoFqWw0ZN1FYWJvTKvmGPVkb8kIydNQyl280exrbFFFuAfN1bQjfLcFUawwkBKh2fm
         hcEvoOjyAPaQVyB+2Y71gSZAkjqgNS0M+SKJDiT3JN/SI8paauOOJtnpA5MyF5ecMtiN
         y0tdKi/KuB4Wql678NWVLVPtQwgzI+dsgn51eQZxYwIZZnHaXhoJah1+/RXtPQu/qcnk
         wsQ9LfH0dJuasK6imYcM1xe9QK7egLNql/tYxbOLeZV9ahv28vOv2i3f+8N+7i3GtJ1D
         lkbvDGLG0VtlUX3MLQhXaQCziADE2ICvZRkFofnQ0jt+kq0vNYGIDi+IbeihHhUD7s97
         vXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782161054; x=1782765854;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oeY7Afs0lbHnR0QncCnTUELZnAVrZhoU3GxTUGfziYk=;
        b=O/WOPeLJk0abskxPYeZqJhZvytLIgDjhXeyFPHCDxw7dwxcQ5kvXgTAQt91RIFoqFb
         QHvaia05gAPCfiLEyP1DeARCNthRa61VMto9FBCgSkHOMD3oUmsyeKCFbZzKpJXGrZy2
         fEsjfu9R603IM/0w22go4QkHRzqb9jWTnD+e/VEwSnD6xzwceDi886uCZMg0dBEtn32E
         pQYx0/+CcSewvbF2FYRdQh8a1buoGNjiE6J+o3hoaVTPeG8EyTHZdUgOwPZUu6wDvE6N
         evGUkOSAXSI7piqgNPLZopIsb0LfmkHMoOIlYlI7/1c7dwG3d8MxakDNCg1DmxQSkTvq
         Nz4A==
X-Forwarded-Encrypted: i=1; AFNElJ875DY/CMGsiL3+ZCB07e3qbnEovWtearcvz1LvmSch2KxLZCJTv01wFDddS60Y9iqoA//y+Bugu+0azw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlSonoHhFKOkBiyuHMufdtCVLtuu6RqnCTi1dEZIZCNruJHR94
	F9HR1XbLutJMsd4yRqjVzJuiiQ+psgLb0Q5QQVwDu1ZfU550tuGa0zPZrG9h2BhU4ct1B4B5zfB
	BNP5gIN40a30wny19Zck4HIgBJlAz
X-Received: from qtwu5.prod.google.com ([2002:a05:622a:105:b0:514:c2a9:36f2])
 (user=briandaniels job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:622a:1923:b0:517:260f:8e95 with SMTP id d75a77b69052e-519e49155f4mr254690411cf.8.1782161054020;
 Mon, 22 Jun 2026 13:44:14 -0700 (PDT)
Date: Mon, 22 Jun 2026 16:43:43 -0400
In-Reply-To: <20260622204343.1994418-1-briandaniels@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260622204343.1994418-1-briandaniels@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260622204343.1994418-9-briandaniels@google.com>
Subject: [PATCH v4 8/8] media: virtio: Add MAINTAINERS entry
From: Brian Daniels <briandaniels@google.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: acourbot@google.com, adelva@google.com, aesteve@redhat.com, 
	changyeon@google.com, daniel.almeida@collabora.com, eperezma@redhat.com, 
	gnurou@gmail.com, gurchetansingh@google.com, hverkuil@xs4all.nl, 
	jasowang@redhat.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mst@redhat.com, nicolas.dufresne@collabora.com, 
	virtualization@lists.linux.dev, xuanzhuo@linux.alibaba.com, 
	Brian Daniels <briandaniels@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Alexandre Courbot <gnurou@gmail.com>

Add an entry for the new virtio-media driver.

Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
Co-developed-by: Brian Daniels <briandaniels@google.com>
Signed-off-by: Brian Daniels <briandaniels@google.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index efbf80806..af370b787 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28327,6 +28327,12 @@ S:	Maintained
 F:	drivers/iommu/virtio-iommu.c
 F:	include/uapi/linux/virtio_iommu.h
 
+VIRTIO MEDIA DRIVER
+M:	Brian Daniels <briandaniels@google.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	drivers/media/virtio/
+
 VIRTIO MEM DRIVER
 M:	David Hildenbrand <david@kernel.org>
 L:	virtualization@lists.linux.dev
-- 
2.55.0.rc0.799.gd6f94ed593-goog

